function car_update(argument0, argument1) {
    // Parameters
    var acc = argument0; // Acceleration input (0 = none, 1 = forward, -1 = reverse)
    var steer = argument1; // Steering input (-max_wheel_angle to max_wheel_angle)
    
    // Variables
    var wheel_angle = 0; // Current wheel angle
    var wheel_angle_set = false; // Flag to ensure wheel angle is set once
    var dangle = 0; // Angle difference for steering
    var wheel_num = array_length_1d(wheels); // Number of wheels
    var wheel = noone; // Current wheel in loop
    var engine = 0; // Engine force

    // Ensure car moves only when in the "moving" state
    if (state != "moving") { 
        if (keyboard_check_pressed(vk_space) && state == "idle") {
            state = "moving"; // Start the car when Space is pressed
        }
        return; // Skip movement logic if not in "moving" state
    }

    // Determine if moving forward or backward
    var moving_forward = dot_product(phy_speed_x, phy_speed_y,
                        lengthdir_x(1, -phy_rotation + 90), 
                        lengthdir_y(1, -phy_rotation + 90)) > 0;

    // Calculate engine force based on acceleration input
    if (acc == 1 && phy_speed <= max_speed) engine = -engine_acc; // Forward
    if (acc == -1) {
        if (moving_forward) engine = engine_brk; // Brake when moving forward
        else if (phy_speed <= max_speed_rev) engine = engine_rev; // Reverse
    }

    // Loop through wheels to apply forces and adjust steering
    for (var i = 0; i < wheel_num; i++) {
        wheel = wheels[i];
        if (!instance_exists(wheel)) continue; // Skip if wheel does not exist

        // Apply engine force to powered wheels
        if (wheel.powered) {
            with (wheel) physics_apply_local_force(0, 0, 0, engine);
        }

        // Adjust wheel angle for rotatable wheels
        if (wheel.rotatable) {
            if (!wheel_angle_set) {
                // Calculate wheel angle and adjust based on steering input
                wheel_angle = wheel.phy_rotation - phy_rotation;
                dangle = angle_difference(clamp(steer, -max_wheel_angle, max_wheel_angle),
                                          wheel_angle);
                wheel_angle += clamp(dangle, -wheel_angle_velocity, wheel_angle_velocity);
                wheel_angle_set = true;
            }
            wheel.phy_rotation = phy_rotation + wheel_angle; // Update wheel rotation
            wheel.phy_angular_velocity = 0; // Prevent rotational drift
        }

        // Kill lateral velocity to control sliding/drift
        if (kill_sideways_speed == 1) {
            with (wheel) kill_sideway_speed(other.drift); // Apply drift control
        }
    }

    // Apply torque for turning based on speed and steering input
    var torque = torque_acc;
    var max_spd = max_speed;
    if (acc == -1 || !moving_forward) { // Adjust for reversing
        torque = -torque_rev;
        max_spd = max_speed_rev;
    }
    physics_apply_torque(torque * sign(steer) * min(phy_speed * 2 / max_spd, 1));

    // Apply angular damping to reduce wobble when not steering
    if (steer == 0) {
        phy_angular_velocity -= sign(phy_angular_velocity) * torque_damp;
    }

    // Stop sliding and reset speed at very low velocities
    if (phy_speed <= 0.2 && acc == 0) {
        phy_speed_x = 0;
        phy_speed_y = 0;
    }
   
}


