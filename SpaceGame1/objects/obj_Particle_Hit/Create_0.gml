/// @description 

particle = instance_create_depth(0, 0, depth, obj_Particles);

particle.set_size(0.5, 1);
particle.set_sprite(spr_Hit, true, true, false);
particle.set_life(7);
particle.set_speed(0);