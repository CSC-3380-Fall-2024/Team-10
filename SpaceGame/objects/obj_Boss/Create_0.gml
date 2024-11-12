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
