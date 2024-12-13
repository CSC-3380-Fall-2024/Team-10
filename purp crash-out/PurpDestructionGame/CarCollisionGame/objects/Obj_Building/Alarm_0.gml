// Respawns a building at a random position
var spawn_x, spawn_y;

repeat (10) { // Try to find a free position
    spawn_x = random_range(50, room_width - 50);
    spawn_y = random_range(50, room_height - 50);

    if (!position_meeting(spawn_x, spawn_y, obj_building)) {
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_building);
        break; // Exit the repeat loop once a valid spot is found
    }
}

