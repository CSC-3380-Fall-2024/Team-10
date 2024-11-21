/// @description 

image_index = 0;

if(keyboard_check(key_up)) {
	y -= fly_speed;
	image_index = 2;
}

if(keyboard_check(key_down)) {
	y += fly_speed;
	image_index = 1;
}


if(keyboard_check(key_shoot)) {
	if(timer_shoot <= 0) {
		timer_shoot = timer_reload;
		
		bullet_show_flash = true;
		alarm_set(0, 4);
		instance_create_depth(x + bullet_spawn_x_offset, y, depth - 1, obj_Bullet);
		
		play_sound(snd_Shoot);
	}
}

timer_shoot -= 1;
if(timer_shoot <= 0) {
	timer_shoot = 0;
}

// juice
draw_timer += 1;