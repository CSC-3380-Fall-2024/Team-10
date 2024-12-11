/// @description Initializes timers for enemy respawn and building despawn.
/// @param enemy_respawn_timer (number) - Timer for respawning enemy vehicles, measured in frames.
/// @param despawn_timer (number) - Timer for despawning buildings, measured in frames.

enemy_respawn_timer = room_speed * 2; // Set the respawn timer to 2 seconds (room_speed = frames per second)
despawn_timer = room_speed * 5; // Set the despawn timer to 5 seconds