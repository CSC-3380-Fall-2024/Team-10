/// @description Initializes various parameters related to the player's ship, including movement, shooting, health, and particle effects. Defines behavior for hit points and destruction.
/// @param {float} image_speed - The speed of the sprite animation. Set to 0 for no animation.
/// @param {integer} image_index - The current frame of the sprite. Set to 0 to show the first frame.
/// @param {integer} key_up - The key code for the "W" key, used to move the ship up.
/// @param {integer} key_down - The key code for the "S" key, used to move the ship down.
/// @param {integer} key_shoot - The key code for the "Space" key, used to shoot.
/// @param {float} timer_reload - The time it takes to reload before the next shot can be fired. Set to 0.2 seconds (room speed * 0.2).
/// @param {float} timer_shoot - A timer used to track the reload time for shooting. Starts equal to `timer_reload`.
/// @param {float} fly_speed - The speed at which the player’s ship moves. Set to 3 units.
/// @param {bool} bullet_show_flash - Determines whether the bullet has a flash effect when shot. Initially set to false.
/// @param {float} bullet_spawn_x_offset - The horizontal offset for bullet spawn, set to slightly off-center for visual effect.
/// @param {float} hitpoints - The current hitpoints of the player's ship. Starts at 3.
/// @param {instance} particle_thrust - The instance for the particle system representing the ship's thrust.
/// @param {instance} particle_destroy - The instance for the particle system that plays on destruction.
/// @param {function} hit - A function to reduce hitpoints and trigger the ship’s destruction when health reaches 0.

image_speed = 0;  // Set animation speed to 0 (no animation)
image_index = 0;  // Set sprite to the first frame

// KEYS
key_up = ord("W");  // "W" key for moving up
key_down = ord("S");  // "S" key for moving down
key_shoot = vk_space;  // Spacebar key for shooting

// SHOOTING
timer_reload = room_speed * 0.2;  // Time between shots, set to 0.2 seconds
timer_shoot = timer_reload  // Set the initial shoot timer equal to reload time

// SPEED
fly_speed = 3;  // Movement speed of the ship

// bullets
bullet_show_flash = false;  // No bullet flash effect by default
bullet_spawn_x_offset = (sprite_width / 2) + 3;  // Offset for bullet spawn from ship's center

_hitpoints = 3;  // Maximum hitpoints for the ship
hitpoints = _hitpoints;  // Set current hitpoints to maximum

// juice
draw_timer = 0;  // Timer for drawing effects (used for visual juice effects)

// thrust particle
particle_thrust = instance_create_depth(x, y, depth, obj_Particles);  // Create thrust particles at the ship's position

particle_thrust.set_shape(pt_shape_square);  // Set particle shape to square
particle_thrust.set_speed(1, 2);  // Set particle speed range
particle_thrust.set_size(0.01, 0.1);  // Set particle size
particle_thrust.set_color(c_purple, c_orange);  // Set color gradient for the particles
particle_thrust.set_direction(178, 182);  // Set particle direction range
particle_thrust.set_depth(depth + 1); 
