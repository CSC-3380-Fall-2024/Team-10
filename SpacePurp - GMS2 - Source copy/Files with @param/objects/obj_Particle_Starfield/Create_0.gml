/// @description Creates a particle field instance with specific emitter settings and properties for a dynamic visual effect.
/// @param {float} x - The x-coordinate where the particle field instance is created.
/// @param {float} y - The y-coordinate where the particle field instance is created.
/// @param {float} depth - The depth at which the particle field instance is created (used for draw order).
/// @param {object} obj_Particles - The object type for the particle field instance.
/// @param {integer} room_width - The width of the current room, used for setting the emitter position and life.
/// @param {integer} room_height - The height of the current room, used for setting the emitter size.
/// @param {color} c_dkgray - The darker gray color for the particle mix.
/// @param {color} c_ltgray - The lighter gray color for the particle mix.

instance_field = instance_create_depth(x, y, depth, obj_Particles);

instance_field.set_emitter_size(0, 0, 0, room_height); // Set the emitter size to span the room's height
instance_field.set_position(room_width + 32, 0); // Position the emitter just outside the right side of the room
instance_field.set_shape(pt_shape_square); // Define the particle shape as a square
instance_field.set_size(0.03, 0.01); // Set particle size range
instance_field.set_direction(180); // Set the direction particles will move (180 degrees = leftward)
instance_field.set_orientation(0, 360, 7); // Set particle orientation with random rotation
instance_field.set_color_mix(c_dkgray, c_ltgray); // Set particle colors to a mix of dark gray and light gray
instance_field.set_speed(1, 3); // Set particle speed range
instance_field.set_life(room_width); // Set particle life span to match the room width (as steps)
instance_field.stream(-12); // Start streaming particles with a negative rate for continuous flow
