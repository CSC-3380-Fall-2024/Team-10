/// @description car_ai_move(angle_to, angle_difference, distance)
/// @param angle_to
/// @param angle_difference
/// @param distance
function car_ai_move(argument0, argument1, argument2) {
    /*
        Controls how the AI moves and reacts to collisions.
    */

    // Arguments
    var angle_to = argument0; // The angle the car should face
    var angle_d  = argument1; // The difference between current angle and target angle
    var dist     = argument2; // The distance to the target

    // Current car angle
    var angle = -phy_rotation + 90;

    // Check if AI car is in "moving" state
    if (state != "moving") {
        acc = 0; // Stop acceleration if not moving
        return;
    }

    // Control Steering
    steer_dir = angle_d;

    // Control Acceleration
    if (ai_col) { // If there is a collision
        // Get forward axis
        var nx = lengthdir_x(1, angle);
        var ny = lengthdir_y(1, angle);

        // Project local collision position onto forward axis
        var m = dot_product(nx, ny, ai_col_x, ai_col_y);

        // Reverse if projection is positive and speed is low
        if (m > 0 && phy_speed <= 1) {
            acc = -1; // Reverse
        } else {
            acc = 1; // Move forward
        }
    } else { // No collision
        if (acc == 0) acc = 1; // Start moving if stationary
        if (acc == -1 && abs(angle_d) <= 3) acc = 1; // Stop reversing if aligned
    }

    // Reduce speed if not facing the target
    if (acc == 1 && abs(angle_d) > 3 && phy_speed > 2) {
        acc = 0; // Slow down
    }

    // Flip steering direction if reversing
    if (acc == -1) {
        steer_dir *= -1;
    }

    // Allow AI to rotate indefinitely (AI-specific behavior)
    var angular_d = angle_d * room_speed - phy_angular_velocity;

    // Automatically face the target to prevent wobble
    if (abs(angle_d) < 3) {
        phy_rotation += angle_d; // Directly set rotation
        phy_angular_velocity = 0; // Stop angular motion
        angular_d = 0; // No additional angular velocity
    }

    // Adjust angular speed based on current velocity
    var factor = max(min(phy_speed / max_speed, 1), 0.1);

    // Clamp angular speed
    angular_d = clamp(angular_d, -45 * factor, 45 * factor);

    // Apply the angular velocity
    phy_angular_velocity += angular_d;

    // Reset collision flag
    ai_col = false;
}
