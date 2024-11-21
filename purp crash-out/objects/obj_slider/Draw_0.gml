/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, image_index, x ,y);

var knob_amount = global.amount_current / amount_max;
var knob_postion_x = x + (sprite_width * knob_amount);

draw_sprite(spr_knob, 0, knob_postion_x ,y);