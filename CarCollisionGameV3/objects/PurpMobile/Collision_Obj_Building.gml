/// @description Handles building destruction, updates the player's score, and schedules a new building respawn.
/// @param other (object) - The building object being destroyed.
/// @param global.score (number) - The player's current score, which is incremented upon building destruction.
/// @param Obj_GameController (object) - The controller object responsible for managing game events.
/// @param alarm[0] (number) - Timer for scheduling the next building respawn, measured in frames.
/// @param room_speed (number) - The number of frames per second in the game.

instance_destroy(other); // Destroy the building

global.score += 10; // Increment the player's score by 10

// Notify the controller to respawn a new building
Obj_GameController.alarm[0] = room_speed * 1; 

// Debug message to log the score and confirm destruction
show_debug_message("Building destroyed! Score: " + string(global.score));