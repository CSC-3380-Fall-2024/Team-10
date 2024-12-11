/// @description Handles wave progression and spawns enemies when the timer matches the current wave's requirements.
/// @param {array} waves - The array containing all wave data. Each wave includes enemies and timing configurations.
/// @param {integer} current_wave - The index of the wave currently in progress.
/// @param {integer} timer - A counter to track time for wave spawning.
/// @param {integer} depth - The depth value for instances being created (used for draw order).
if (current_wave > array_length(waves) - 1) {
    show_debug_message("Reached end of waves, " + string(current_wave));
    instance_destroy();
    return;
}

timer += 1;

// Check if the timer exceeds or equals the spawn time for the current wave
if (timer >= waves[current_wave].timer) {
    show_debug_message("Spawning Wave: " + string(current_wave + 1));

    // Create enemies for the current wave
    var position_x = 0;
    var position_y = 0;

    // Iterate through the number of enemies in the current wave
    for (var enemy_index = 0; enemy_index < waves[current_wave].enemies._count; enemy_index++) {
        // Assign the base position for the enemy
        position_x = waves[current_wave].enemies._x;
        position_y = waves[current_wave].enemies._y;
        
        // Apply padding to position based on enemy index
        position_x += enemy_index * waves[current_wave].enemies._x_padding;
        position_y += enemy_index * waves[current_wave].enemies._y_padding;
        
        // Create the enemy instance in the room
        var instance = instance_create_depth(position_x, position_y, depth, waves[current_wave].enemies._object);
        
        // Additional customizations for the created instance can be added here if needed
    }
    
    // Reset timer and proceed to the next wave
    timer = 0;
    current_wave += 1;
}
