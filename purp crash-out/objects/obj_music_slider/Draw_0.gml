/// @description Insert description here
// You can write your code in this editor
draw_self();
//draws the number to know the volume
var volume_percentage = string(round(global.music_volume *100));
draw_text(x + sprite_width/2 + 135, y - sprite_height/2 - 8, volume_percentage);

//draw music so user knows what they are changing
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x + 130, y - 60, "Music");


/**
//draws the dimensions of the slider helps with making sure it had the right dimensions
draw_circle(global.slider_min_x, y, 5, true); // Draw the min bound
draw_circle(global.slider_max_x, y, 5, true); // Draw the max bound
draw_line(global.slider_min_x, y, global.slider_max_x, y); // Draw the range

