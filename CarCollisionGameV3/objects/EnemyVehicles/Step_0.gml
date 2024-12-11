/// @description Moves the enemy vehicle toward the target and adjusts its rotation.
/// @param target (object) - The object that the enemy vehicle is pursuing.
/// @param speed (number) - The speed of the enemy vehicle.
/// @param direction (number) - The direction angle (in degrees) the enemy vehicle is moving.
/// @param x (number) - The x-coordinate of the enemy vehicle.
/// @param y (number) - The y-coordinate of the enemy vehicle.
/// @param image_angle (number) - The rotation angle of the enemy vehicle's sprite.

if (instance_exists(target)) {
    // Calculate direction to the target
    var dx = target.x - x; // Difference in x-coordinates
    var dy = target.y - y; // Difference in y-coordinates
    var angle_to_target = point_direction(x, y, target.x, target.y); // Angle toward the target

    // Move toward the target
    direction = angle_to_target; // Set movement direction
    x += lengthdir_x(speed, direction); // Update x-coordinate
    y += lengthdir_y(speed, direction); // Update y-coordinate

    // Face the target (rotate sprite to face target)
    image_angle = direction;
}