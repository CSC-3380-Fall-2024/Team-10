/// @description Insert description here
// You can write your code in this editor

/**
 * Calculates the scaled width of the slider and sets the minimum and maximum x-coordinates for the slider.
 * 
 * @param sprite_width (integer) The width of the sprite used for the slider.
 * @param image_xscale (float) The horizontal scale factor of the sprite, affecting its width.
 * @param x (integer) The x-coordinate of the slider's center position.
 * @param scaled_width (integer) The scaled width of the slider after applying the scale factor.
 * @param global.slider_min_x (integer) The minimum x-coordinate for the slider, used for positioning.
 * @param global.slider_max_x (integer) The maximum x-coordinate for the slider, used for positioning.
 */
var scaled_width = sprite_width * image_xscale;

global.slider_min_x = x - (scaled_width / 2) + 265;
global.slider_max_x = x + (scaled_width / 2) - 10;

