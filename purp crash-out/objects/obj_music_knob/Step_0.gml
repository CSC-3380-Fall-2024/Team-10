/**
 * Checks if the volume control knob is being clicked and adjusts the volume based on the knob's position.
 * 
 * @param mouse_check_button (function) Checks if the left mouse button is being pressed.
 * @param mb_left (integer) The left mouse button identifier.
 * @param mouse_x (integer) The x-coordinate of the mouse pointer.
 * @param mouse_y (integer) The y-coordinate of the mouse pointer.
 * @param x (integer) The x-coordinate of the volume control knob, which will be updated based on the mouse position.
 * @param sprite_width (integer) The width of the volume control knob sprite.
 * @param sprite_height (integer) The height of the volume control knob sprite.
 * @param global.slider_min_x (integer) The minimum x-coordinate for the volume slider.
 * @param global.slider_max_x (integer) The maximum x-coordinate for the volume slider.
 * @param global.music_volume (float) The current volume level, ranging from 0 to 1.
 */
 
// Check if knob is being clicked
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
    // Makes it so the knob is on the slider
    x = clamp(mouse_x, global.slider_min_x, global.slider_max_x);

    // Update the volume based on the knob's position
    global.music_volume = (x - global.slider_min_x) / (global.slider_max_x - global.slider_min_x);
    global.music_volume = clamp(global.music_volume, 0, 1);
    audio_master_gain(global.music_volume);
}

