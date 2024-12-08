/// @description Initializes the random number generator, adjusts the position of the instance, and sets up initial properties for animation or movement.
/// @param {float} position_x_finished - The final x-coordinate position where the instance will end up after the movement.
/// @param {float} _lerp_speed - The speed at which the interpolation will occur for smooth transitions.

randomize();  // Initialize the random number generator to ensure randomness in future functions

position_x_finished = x;  // Store the current x-position as the target position to reach after movement
x = position_x_finished - 300;  // Adjust the x-position by moving it 300 units to the left

image_alpha = 0;  // Set the image transparency to 0 (fully transparent)
_lerp_speed = 0.02;  // Set the speed of the interpolation (used for smooth transitions or animations)
