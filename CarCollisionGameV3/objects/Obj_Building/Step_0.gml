/// @description Handles the countdown for enemy respawn and spawns a new enemy when the timer reaches zero.
/// @param enemy_respawn_timer (number) - Timer counting down to the next enemy respawn, measured in frames.
/// @param spawn_x (number) - The x-coordinate where the enemy vehicle will be spawned.
/// @param spawn_y (number) - The y-coordinate where the enemy vehicle will be spawned.

enemy_respawn_timer -= 1; // Decrement the respawn timer by 1 each frame

// Respawn enemy when timer reaches 0
if (enemy_respawn_timer <= 0) {
    // Randomly spawn an enemy at the top of the screen
    var spawn_x = random_range(50, room_width - 50); // Random x-coordinate within room width
    var spawn_y = -32; // Spawn slightly off-screen above the top of the screen
    instance_create_layer(spawn_x, spawn_y, "Instances", EnemyVehicles);

    // Reset the timer for the next respawn
    enemy_respawn_timer = room_speed * 20; // Reset to 20 seconds (adjust as needed)
}

