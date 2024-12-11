/// @description Respawns a building at a random position within the room boundaries, ensuring no overlap with other buildings.
/// @param spawn_x (number) - The x-coordinate for the building's spawn position.
/// @param spawn_y (number) - The y-coordinate for the building's spawn position.
/// @param obj_building (object) - The object representing the building to be respawned.

var spawn_x, spawn_y; // Variables to hold the random spawn coordinates

repeat (10) { // Try to find a free position up to 10 times
    spawn_x = random_range(50, room_width - 50); // Random x-coordinate within room bounds
    spawn_y = random_range(50, room_height - 50); // Random y-coordinate within room bounds

    // Check if the position is free (no overlap with other buildings)
    if (!position_meeting(spawn_x, spawn_y, obj_building)) {
        // Spawn the building at the random position
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_building);
        break; // Exit the loop once a valid spot is found
    }
}
