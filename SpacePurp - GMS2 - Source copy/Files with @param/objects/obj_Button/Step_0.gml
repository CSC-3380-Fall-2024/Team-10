/// @description Smoothly interpolates the position and transparency of the instance towards their target values.
/// @param {float} x - The current x-coordinate of the instance, which will be interpolated towards `position_x_finished`.
/// @param {float} position_x_finished - The target x-coordinate the instance will move towards, used for smooth movement.
/// @param {float} image_alpha - The current transparency level of the instance, which will be interpolated towards 1 (fully visible).
/// @param {float} _lerp_speed - The speed at which interpolation occurs for smooth transitions.

x = lerp(x, position_x_finished, _lerp_speed);  // Smoothly interpolate the x-position towards the target position
image_alpha = lerp(image_alpha, 1, _lerp_speed);  // Smoothly interpolate the transparency towards full opacity (1)
