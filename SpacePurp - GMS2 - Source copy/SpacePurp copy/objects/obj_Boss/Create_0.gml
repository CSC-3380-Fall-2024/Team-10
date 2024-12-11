/// @description 

enum BOSS_SHOOTING {
	none,
	single,
	line,
	tri,
	circle,
	rand,
}

enum BOSS_STATES {
	reset,
	intro,
	idle,
	move,
	shoot,
	dying,
	death,
}

_hitpoints = 200;
hitpoints = _hitpoints;

width_half = sprite_width / 2;
height_half = sprite_height / 2;

shot_timer = room_speed * 2.5;

_timer = room_speed * 5;
timer = _timer;


state = BOSS_STATES.intro;
state_shot = BOSS_SHOOTING.none;

bullet_count = 0; // used to keep track of how many bullets we fired

is_moving = false;
position_next_y = y;

// set starting position
x = room_width + 192;
y = room_height / 2;

// health bar (for intro)
health_bar_alpha = 0;

movement_constraints = {
	top: 64,
	bottom: 320,
	_speed: 4,
};

hit = function() {
	if(state != BOSS_STATES.intro) {
		show_debug_message("Boss Hit");
		
		hitpoints -= 1;
		if(hitpoints <= 0) {
			timer = room_speed * 2;
			state = BOSS_STATES.dying;
			state_shot = BOSS_SHOOTING.none;
		}
		
		var instance_particle = instance_find(obj_Particle_Hit, 0);
		if(instance_particle != noone) {
			var xx = x + random_range(-width_half, width_half);
			var yy = y + random_range(-height_half, height_half);
			instance_particle.particle.set_position(xx, yy);
			instance_particle.particle.burst(1);
		}
	} else {
		show_debug_message("No hit, in intro state");
	}
}

// death particles
particle_death = instance_create_depth(x, y, depth, obj_Particles);
particle_death.set_sprite(spr_Explosion, true, true, false);
particle_death.set_life(10, 20);