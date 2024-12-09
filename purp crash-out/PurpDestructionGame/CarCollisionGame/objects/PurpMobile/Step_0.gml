// Inputs
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var forward = keyboard_check(vk_up);
var backward = keyboard_check(vk_down);

// Acceleration and Deceleration
if (forward) {
    speed = min(speed + acceleration, max_speed); // Accelerate forward
} 
if (backward) {
    speed = max(speed - acceleration, -max_speed / 2); // Reverse at half the forward max speed
}

// Friction (apply when no input is given)
if (!forward && !backward) {
    if (speed > 0) {
        speed = max(speed - friction, 0); // Gradual slowdown
    } else if (speed < 0) {
        speed = min(speed + friction, 0); // Gradual slowdown in reverse
    }
}

// Turning
if (left && speed != 0) {
    direction += turn_speed * sign(speed); // Turn left based on speed direction
}
if (right && speed != 0) {
    direction -= turn_speed * sign(speed); // Turn right based on speed direction
}

// Update position
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Rotate sprite to match direction
image_angle = direction;
