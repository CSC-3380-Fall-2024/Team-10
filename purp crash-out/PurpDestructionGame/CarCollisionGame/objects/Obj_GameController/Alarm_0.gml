var spawn_x, spawn_y;

repeat (10) { // Try up to 10 times to find a valid position
    spawn_x = random_range(50, room_width - 50);
    spawn_y = random_range(50, room_height - 50);

    // Ensure obj_building exists and avoid overlap
    if (object_exists(Obj_Building)) {
        if (!position_meeting(spawn_x, spawn_y, Obj_Building)) {
            instance_create_layer(spawn_x, spawn_y, "Instances", Obj_Building);
            break; // Stop trying once a valid position is found
        }
    } else {
        // If obj_building does not exist, log a debug message
        show_debug_message("ERROR: Obj_Building object is not defined!");
        break;
    }
}