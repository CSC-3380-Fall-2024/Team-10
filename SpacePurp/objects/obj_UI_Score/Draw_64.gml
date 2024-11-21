/// @description 

draw_set_align(fa_right, fa_middle);
draw_set(1, c_white);

draw_text_ext_transformed(display_get_gui_width() - 30, 10, "Score: " + string(global.current_score), 0, room_width, 2, 2, 0);