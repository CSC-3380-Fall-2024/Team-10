/// @description Insert description here
// You can write your code in this editor
//check if knob is being clicked
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
    //makes it so knob is on slider
    x = clamp(mouse_x, global.slider_min_x, global.slider_max_x);

    // Update the volume based on the knob's position
    global.music_volume = (x - global.slider_min_x) / (global.slider_max_x - global.slider_min_x);
    global.music_volume = clamp(global.music_volume, 0, 1);
    audio_master_gain(global.music_volume);
}
