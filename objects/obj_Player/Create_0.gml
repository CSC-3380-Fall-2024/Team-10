/// @description 

image_speed = 0;
image_index = 0;

// KEYS
key_up = ord("W");
key_down = ord("S");
key_shoot = vk_space;

// SHOOTING
timer_reload = room_speed * 0.2;
timer_shoot = timer_reload

// SPEED
fly_speed = 3;

// bullets
bullet_show_flash = false;
bullet_spawn_x_offset = (sprite_width / 2) + 3;

_hitpoints = 3;
hitpoints = _hitpoints;

// juice
draw_timer = 0;

// thrust particle
particle_thrust = instance_create_depth(x, y, depth, obj_Particles);

particle_thrust.set_shape(pt_shape_square);
particle_thrust.set_speed(1, 2);
particle_thrust.set_size(0.01, 0.1);
particle_thrust.set_color(c_purple, c_orange);
particle_thrust.set_direction(178, 182);
particle_thrust.set_depth(depth + 1);
particle_thrust.stream(2);

// destroy particles
particle_destroy = instance_create_depth(x, y, depth, obj_Particles);
particle_destroy.set_direction(170, 190);
particle_destroy.set_sprite(spr_Explosion, true, true, false);

// hit
hit = function() {
	hitpoints -= 1;
	
	if(hitpoints <= 0) {
		// remove thrust particles
		particle_thrust.stream(0);
		particle_thrust.set_timer(room_speed * 1);
		
		// add destroy particles
		particle_destroy.burst(10);
		particle_destroy.set_timer(room_speed * 2);
		
		// remove ship
		instance_destroy();
	}
}