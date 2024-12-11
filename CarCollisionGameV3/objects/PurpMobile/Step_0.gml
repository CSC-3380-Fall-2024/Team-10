/// @description Handles car inputs, movement, acceleration, deceleration, turning, and screen boundary constraints.
/// @param left (boolean) - Whether the left arrow key is pressed.
/// @param right (boolean) - Whether the right arrow key is pressed.
/// @param forward (boolean) - Whether the up arrow key is pressed.
/// @param backward (boolean) - Whether the down arrow key is pressed.
/// @param acceleration (number) - The rate of speed increase when moving forward or backward.
/// @param max_speed (number) - The maximum forward or reverse speed.
/// @param friction (number) - The rate at which the car slows down when no input is provided.
/// @param turn_speed (number) - The rate at which the car turns when left or right keys are pressed.
/// @param speed (number) - The current speed of the car.
/// @param direction (number) - The direction the car is moving, in degrees.
/// @param x (number) - The x-coordinate of the car's position.
/// @param y (number) - The y-coordinate of the car's position.
/// @param room_width (number) - The width of the room, used to constrain movement.
/// @param room_height (number) - The height of the room, used to constrain movement.
/// @param image_angle (number) - The angle of the car's sprite.

/// Inputs
var left = keyboard_check(vk_left);  // Check if the left arrow key is pressed
var right = keyboard_check(vk_right); // Check if the right arrow key is pressed
var forward = keyboard_check(vk_up);  // Check if the up arrow key is pressed
var backward = keyboard_check(vk_down); // Check if the down arrow key is pressed

/// Acceleration and Deceleration
if (forward) {
    speed = min(speed + acceleration, max_speed); // Accelerate forward
} 
if (backward) {
    speed = max(speed - acceleration, -max_speed / 2); // Reverse at half the forward max speed
}

/// Friction (apply when no input is given)
if (!forward && !backward) {
    if (speed > 0) {
        speed = max(speed - friction, 0); // Gradual slowdown
    } else if (speed < 0) {
        speed = min(speed + friction, 0); // Gradual slowdown in reverse
    }
}

/// Turning
if (left && speed != 0) {
    direction += turn_speed * sign(speed); // Turn left based on speed direction
}
if (right && speed != 0) {
    direction -= turn_speed * sign(speed); // Turn right based on speed direction
}

/// Update position
x += lengthdir_x(speed, direction); // Update x-coordinate based on speed and direction
y += lengthdir_y(speed, direction); // Update y-coordinate based on speed and direction

/// Boundary Constraints
if (x < 0 || x > room_width) {
    speed = -speed; // Reverse speed horizontally if out of bounds
}
if (y < 0 || y > room_height) {
    speed = -speed; // Reverse speed vertically if out of bounds
}

/// Rotate sprite to match direction
image_angle = direction; // Set the sprite's angle to match the car's direction
