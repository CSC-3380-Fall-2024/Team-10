/// @description 

timer = 0;
current_wave = 0;

waves = [
	{ // wave 1
		timer: room_speed * 5,
		enemies: {
				_count: 6,
				_object: obj_Asteroid,
				_x: room_width + 64,
				_y: room_height / 2,
				_x_padding: 38,
				_y_padding: 0,
		}
	},
	{ // wave 2
		timer: room_speed * 8,
		enemies: {
				_count: 6,
				_object: obj_Asteroid,
				_x: room_width + 64,
				_y: 64,
				_x_padding: 0,
				_y_padding: 38,
		}
	},
	{ // wave 3
		timer: room_speed * 8,
		enemies: {
				_count: 6,
				_object: obj_Asteroid,
				_x: room_width + 64,
				_y: room_height - 64,
				_x_padding: 0,
				_y_padding: -38,
		}
	},
	{ // wave 4
		timer: room_speed * 8,
		enemies: {
				_count: 6,
				_object: obj_Asteroid,
				_x: room_width + 64,
				_y: room_height - 64,
				_x_padding: 38,
				_y_padding: -38,
		}
	},
	{ // wave 5, boss
		timer: room_speed * 5,
		enemies: {
				_count: 1,
				_object: obj_Boss,
				_x: room_width + 192,
				_y: room_height / 2,
				_x_padding: 0,
				_y_padding: 0,
		}
	},
];