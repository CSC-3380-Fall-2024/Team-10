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
	// shoot
}
