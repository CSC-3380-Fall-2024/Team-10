/// @description 

draw_sprite(sprite_index, image_index, x, y + sin(draw_timer * 0.1) * 2);

if(bullet_show_flash) {
	draw_sprite(spr_Flash, 0, x + 8 + bullet_show_flash, y);
}

// draw hitpoints
var ui_padding = 24;
draw_set(1, c_white);
draw_set_align(fa_left);
draw_text(10, 10, "Hitpoints");

for (var i = 0; i < _hitpoints; i++) {
    if(i < hitpoints) {
		draw_sprite_ext(spr_Player, 0, 20 + (i * ui_padding), 40, 0.5, 0.5, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_Player, 0, 20 + (i * ui_padding), 40, 0.5, 0.5, 0, c_white, 0.5);
	}
}

// draw score
//draw_text(10, 10, "Score: " + string(global.current_score));