if (fade_out) {
	if (a < 1){ 
		a += fadeoutrate;
	} else{
		a = 1;
		room_goto(target_room);
	}
} else { 
	if (a > 0) {
		a -= fadeinrate;
	} else {
		a = 0;
			instance_destroy();
	}
}