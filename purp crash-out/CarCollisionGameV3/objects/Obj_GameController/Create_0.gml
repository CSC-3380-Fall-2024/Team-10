/// @description Spawns a specified number of buildings at random positions within the room, avoiding overlap.
/// @param building_count (number) - The total number of buildings to spawn.
/// @param spawn_x (number) - The x-coordinate for the building's spawn position.
/// @param spawn_y (number) - The y-coordinate for the building's spawn position.
/// @param Obj_Building (object) - The object representing the building to be spawned.

var building_count = 12; // Number of buildings to spawn

// Loop through the number of buildings to spawn
for (var i = 0; i < building_count; i++) {
    var spawn_x, spawn_y; // Variables to hold random coordinates

    repeat (10) { // Try up to 10 times to find a valid position
        spawn_x = random_range(50, room_width - 50); // Random x-coordinate within room boundaries
        spawn_y = random_range(50, room_height - 50); // Random y-coordinate within room boundaries

        // Check for overlap only if Obj_Building exists
        if (object_exists(Obj_Building)) {
            if (!position_meeting(spawn_x, spawn_y, Obj_Building)) {
                // Spawn the building at the calculated position
                instance_create_layer(spawn_x, spawn_y, "Instances", Obj_Building);
                break; // Stop the loop once a valid position is found
            }
        } else {
            // If Obj_Building does not exist, log a debug message
            show_debug_message("ERROR: Obj_Building object is not defined!");
            break;
        }
    }
}