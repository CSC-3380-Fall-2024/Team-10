/**
 * Draws the volume control slider with the current volume percentage and a label for the music setting.
 * 
 * @param global.music_volume (float) The current music volume, ranging from 0 to 1, used to calculate the volume percentage.
 * @param x (integer) The x-coordinate of the volume slider.
 * @param y (integer) The y-coordinate of the volume slider.
 * @param sprite_width (integer) The width of the sprite used for the volume slider.
 * @param sprite_height (integer) The height of the sprite used for the volume slider.
 * @param volume_percentage (string) The string representation of the current volume percentage.
 * @param fnt_menu (font) The font used to display the "Music" label.
 */
draw_self();

// Draws the volume percentage to indicate the current volume level
var volume_percentage = string(round(global.music_volume * 100));
draw_text(x + sprite_width / 2 + 135, y - sprite_height / 2 - 8, volume_percentage);

// Draw the music label to indicate what the user is changing
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x + 130, y - 60, "Music");


/**
//draws the dimensions of the slider helps with making sure it had the right dimensions
draw_circle(global.slider_min_x, y, 5, true); // Draw the min bound
draw_circle(global.slider_max_x, y, 5, true); // Draw the max bound
draw_line(global.slider_min_x, y, global.slider_max_x, y); // Draw the range

