/// @description 

instance_field = instance_create_depth(x, y, depth, obj_Particles);

instance_field.set_emitter_size(0, 0, 0, room_height);
instance_field.set_position(room_width + 32, 0);
instance_field.set_shape(pt_shape_square);
instance_field.set_size(0.03, 0.01);
instance_field.set_direction(180);
instance_field.set_orientation(0, 360, 7);
instance_field.set_color_mix(c_dkgray, c_ltgray);
instance_field.set_speed(1, 3);
instance_field.set_life(room_width);
instance_field.stream(-12);