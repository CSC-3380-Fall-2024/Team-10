/// @description Handles the destruction of a building, increases the player's score, respawns the building, and schedules the next respawn.
/// @param global.score (number) - The player's current score.
/// @param other (object) - The building object being destroyed.
/// @param spawn_x (number) - The x-coordinate for the new building's spawn position.
/// @param spawn_y (number) - The y-coordinate for the new building's spawn position.
/// @param Obj_Building (object) - The object representing the building to respawn.
/// @param Obj_GameController (object) - The controller object responsible for managing game events.
/// @param alarm[0] (number) - Timer for scheduling the next respawn.

global.score += 10; // Add 10 points to the player's score

instance_destroy(other); // Destroy the building

// Generate random coordinates for the new building
var spawn_x = random_range(50, room_width - 50);
var spawn_y = random_range(50, room_height - 50);

// Create a new building at the random position
instance_create_layer(spawn_x, spawn_y, "Instances", Obj_Building);

// Schedule the next respawn after 5 seconds
Obj_GameController.alarm[0] = room_speed * 5;