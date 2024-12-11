/// @description Spawns a building at a random position within the room, ensuring no overlap with existing buildings.
/// @param spawn_x (number) - The x-coordinate for the building's spawn position.
/// @param spawn_y (number) - The y-coordinate for the building's spawn position.
/// @param Obj_Building (object) - The object representing the building to be spawned.

var spawn_x, spawn_y; // Variables to hold the random spawn coordinates

repeat (10) { // Try up to 10 times to find a valid position
    spawn_x = random_range(50, room_width - 50); // Generate a random x-coordinate within room boundaries
    spawn_y = random_range(50, room_height - 50); // Generate a random y-coordinate within room boundaries

    // Ensure Obj_Building exists and avoid overlap
    if (object_exists(Obj_Building)) {
        if (!position_meeting(spawn_x, spawn_y, Obj_Building)) {
            // Spawn the building at the random position
            instance_create_layer(spawn_x, spawn_y, "Instances", Obj_Building);
            break; // Stop trying once a valid position is found
        }
    } else {
        // If Obj_Building does not exist, log a debug message
        show_debug_message("ERROR: Obj_Building object is not defined!");
        break;
    }   
}