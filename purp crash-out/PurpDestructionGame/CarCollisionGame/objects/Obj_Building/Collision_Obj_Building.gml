global.score += 10;// Add 10 points to the score

instance_destroy(other); // Destroy the building

var spawn_x = random_range(50, room_width - 50);

var spawn_y = random_range(50, room_height - 50);

instance_create_layer(spawn_x, spawn_y, "Instances", Obj_Building);

// Schedules spawn and the amount of time it takes to respawn post destruction. 
Obj_GameController.alarm[0] = room_speed * 0.2;
