/// @description Controls the movement and shooting of the ship, including animation updates and bullet spawning.
/// @param {integer} key_up - The key code for moving the ship upwards (e.g., "W").
/// @param {integer} key_down - The key code for moving the ship downwards (e.g., "S").
/// @param {integer} key_shoot - The key code for shooting (e.g., "Space").
/// @param {float} fly_speed - The movement speed of the ship. Affects the speed at which the ship moves up and down.
/// @param {float} timer_shoot - A timer that tracks when the ship can shoot again, ensuring the reload time is respected.
/// @param {float} timer_reload - The time between shots, controlling the rate of fire.
/// @param {bool} bullet_show_flash - Determines whether the bullet should show a flash effect when fired.
/// @param {float} bullet_spawn_x_offset - The horizontal offset at which the bullet is spawned relative to the ship's center.
/// @param {instance} obj_Bullet - The object representing the bullet to be created when the ship shoots.

image_index = 0;  // Reset the image index to show the default sprite

// Movement controls for the ship
if(keyboard_check(key_up)) {  // Check if the up key is pressed
	y -= fly_speed;  // Move the ship upwards by the defined speed
	image_index = 2;  // Change the sprite to the "up" animation/frame
}

if(keyboard_check(key_down)) {  // Check if the down key is pressed
	y += fly_speed;  // Move the ship downwards by the defined speed
	image_index = 1;  // Change the sprite to the "down" animation/frame
}

// Shooting logic
if(keyboard_check(key_shoot)) {  // Check if the shoot key is pressed
	if(timer_shoot <= 0) {  // If the shoot timer is ready (i.e., 0 or less)
		timer_shoot = timer_reload;  // Reset the shoot timer based on the reload time
		
		bullet_show_flash = true;  // Trigger the flash effect for the bullet
		alarm_set(0, 4);  // Set an alarm to end the flash effect after 4 cycles
		instance_create_depth(x + bullet_spawn_x_offset, y, depth - 1, obj_Bullet);  // Create a new bullet instance at the defined spawn position
		
		play_sound(snd_Shoot);  // Play the shooting sound
	}
}

// Decrease the shoot timer to manage reload time
timer_shoot -= 1;  
if(timer_shoot <= 0) {  // Ensure the timer doesn't go below 0
	timer_shoot = 0;  // Set the timer to 0 if it reaches a negative value
}

// Juice effect
draw_timer += 1;  // Increment the draw timer (likely for visual effects or animations)
