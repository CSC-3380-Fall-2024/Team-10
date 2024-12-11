// Destroy the building
instance_destroy(other);

global.score += 10;

// Notify the controller to respawn a new building
Obj_GameController.alarm[0] = room_speed * 1; // Respawn after 3 seconds

show_debug_message("Building destroyed! Score: " + string(global.score));