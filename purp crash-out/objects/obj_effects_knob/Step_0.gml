/// @description Insert description here
// You can write your code in this editor
//check if knob is being clicked
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
    // Drag the knob along the slider's background
    x = clamp(mouse_x, global.effects_slider_min_x, global.effects_slider_max_x);
    
    // Calculate the volume based on the knob's position
    global.effects_volume = (x - global.effects_slider_min_x) / (global.effects_slider_max_x - global.effects_slider_min_x);
    global.effects_volume = clamp(global.effects_volume, 0, 1); // Ensure volume stays between 0 and 1

}

