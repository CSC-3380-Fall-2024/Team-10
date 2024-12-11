/// @description Draws the current score on the screen with specified formatting and alignment.
/// @param {int} global.current_score - The current score to be displayed.
/// @param {int} display_get_gui_width() - The width of the screen, used for positioning the score at the right edge of the display.
/// @param {float} 0 - The rotation angle for the text, here it's 0, meaning no rotation.
/// @param {int} room_width - The width of the room, used to scale the text width for proper text wrapping.
/// @param {int} 2 - The horizontal scaling factor of the text.
/// @param {int} 2 - The vertical scaling factor of the text.
/// @param {int} 0 - The color shift value, used here to leave the color as-is.

draw_set_align(fa_right, fa_middle);  // Align the text to the right and vertically center it
draw_set(1, c_white);  // Set the color to white for the text

// Draw the current score at the top-right of the screen, scaling the text size.
draw_text_ext_transformed(display_get_gui_width() - 30, 10, "Score: " + string(global.current_score), 0, room_width, 2, 2, 0);
