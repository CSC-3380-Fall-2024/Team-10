/// @description car_ai_update()
function car_ai_update() {
    // Description:
    // Updates AI properties and allows AI to move.

    // Ensure AI target exists
    if (!instance_exists(ai_target)) {
        car_ai_get_target(); // Try to find a target
    }

    if (!instance_exists(ai_target)) {
        state = "idle"; // Set state to idle if no target
        return; // Exit if no target
    }

    // AI Setup
    var tx = ai_target.x; // Target X position
    var ty = ai_target.y; // Target Y position

    // Get forward angle of the car
    var angle = -phy_rotation + 90;

    // Get the angle between AI and target
    var angle_dir = point_direction(x, y, tx, ty);

    // Get the angle difference between movement angle and the AI-target angle
    var angle_diff = angle_difference(angle, angle_dir);

    // Get the distance to target
    var dist = point_distance(x, y, tx, ty);

    // Check if car should start moving
    if (state == "idle" && dist > 50) { // Example condition to start moving
        state = "moving"; // Transition to moving state
    }

    // Only move the car if it's in the "moving" state
    if (state == "moving") {
        car_ai_move(angle_dir, angle_diff, dist);
    }

    // Stop the car if it reaches the target
    if (dist < 10) { // Example distance to stop at
        state = "idle"; // Stop the car
        car_ai_get_target(); // Find a new target
    }
}
