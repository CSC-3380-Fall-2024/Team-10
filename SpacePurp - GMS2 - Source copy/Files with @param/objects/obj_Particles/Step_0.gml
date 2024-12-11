/// @description Moves the current instance to the position of the target instance if the target exists.
/// @param {instance} target_instance - The instance to which the current instance should move, if it exists.
/// @param {float} target_instance.x - The x-coordinate of the target instance's position.
/// @param {float} target_instance.y - The y-coordinate of the target instance's position.

if(target_instance != noone) {  // Check if the target instance is valid (not 'noone')
	if(instance_exists(target_instance)) {  // Ensure the target instance still exists in the game world
		set_position(  // Move the current instance to the target instance's position
			target_instance.x,  // Set the x-coordinate to the target's x position
			target_instance.y   // Set the y-coordinate to the target's y position
		);
	}
}
