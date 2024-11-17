/// @description 

if(current_wave > array_length(waves) - 1) {
	show_debug_message("Reached end of waves, " + string(current_wave));
	instance_destroy();
	return;
}

timer += 1;

// is the timer bigger than whatever wave we are on?
if(timer >= waves[current_wave].timer) {
	show_debug_message("Spawning Wave: " + string(current_wave + 1));

	// create enemies
	
	// how many?
	var position_x = 0;
	var position_y = 0;
	for(var enemy_index = 0; enemy_index < waves[current_wave].enemies._count; enemy_index++) {
		// assign position
		position_x = waves[current_wave].enemies._x;
		position_y = waves[current_wave].enemies._y;
		
		// add padding where required
		position_x += enemy_index * waves[current_wave].enemies._x_padding;
		position_y += enemy_index * waves[current_wave].enemies._y_padding;
		
		// add enemy into room
		var instance = instance_create_depth(position_x, position_y, depth, waves[current_wave].enemies._object);
		
		// here we could do more to the instance if needed
	}
	
	timer = 0;
	current_wave += 1;
}