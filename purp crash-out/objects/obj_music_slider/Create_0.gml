/**
 * Calculates the scaled width of the volume slider and sets the minimum and maximum x-coordinates for the slider.
 * 
 * @param sprite_width (integer) The width of the sprite used for the volume slider.
 * @param image_xscale (float) The horizontal scale factor of the sprite, affecting its width.
 * @param x (integer) The x-coordinate of the center of the volume slider.
 * @param global.slider_min_x (integer) The minimum x-coordinate for the volume slider, calculated based on the slider's position and scaled width.
 * @param global.slider_max_x (integer) The maximum x-coordinate for the volume slider, calculated based on the slider's position and scaled width.
 */
var scaled_width = sprite_width * image_xscale;

global.slider_min_x = x - (scaled_width / 2) + 265;
global.slider_max_x = x + (scaled_width / 2) - 10;
