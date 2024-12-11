/// @description Creates a particle effect at the current position with customized size, sprite, lifetime, and speed.
/// @param {float} depth - The depth at which the particle instance is created (used for draw order).
/// @param {object} obj_Particles - The object type for the particle instance being created.
/// @param {sprite} spr_Hit - The sprite used for the particle animation.
/// @param {float} size_min - The minimum size scaling factor for the particle (default is 0.5).
/// @param {float} size_max - The maximum size scaling factor for the particle (default is 1).
/// @param {integer} life - The lifespan of the particle in steps (default is 7).
/// @param {float} speed - The movement speed of the particle (default is 0).

particle = instance_create_depth(0, 0, depth, obj_Particles);

particle.set_size(0.5, 1); // Set the size range of the particle
particle.set_sprite(spr_Hit, true, true, false); // Assign a sprite with animation settings
particle.set_life(7); // Set the particle's lifespan
particle.set_speed(0); // Set the particle's movement speed
