/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 04557647
/// @DnDArgument : "code" "/// @description particle system$(13_10)$(13_10)randomize();$(13_10)$(13_10)#region DEFAULT VARIABLES$(13_10)$(13_10)	target_instance = noone;$(13_10)	emitter_randomize = false;$(13_10)	$(13_10)	emitter_size = {$(13_10)		_left: 1,$(13_10)		_right: 1,$(13_10)		_top: 1,$(13_10)		_bottom: 1,$(13_10)	}$(13_10)$(13_10)	offset = {$(13_10)		_x: 0,$(13_10)		_y: 0,$(13_10)	}$(13_10)$(13_10)#endregion$(13_10)$(13_10)#region HELPER $(13_10)	/// @func set_blend(blend)$(13_10)	/// @desc blends the particles together$(13_10)	/// @param _blend$(13_10)	set_blend = function(_blend = true) {$(13_10)		part_type_blend(pt, _blend);$(13_10)	}$(13_10)	$(13_10)	/// @func set_shape(shape)$(13_10)	/// @param _shape$(13_10)	set_shape = function(_shape = pt_shape_pixel) {$(13_10)		part_type_shape(pt, _shape);$(13_10)	}$(13_10)	$(13_10)	/// @func set_sprite(sprite, animated, stretched, random_frame)$(13_10)	/// @param _sprite$(13_10)	set_sprite = function(_sprite, _animated = false, _stretched = false, _random_frame = true) {$(13_10)		part_type_sprite(pt, _sprite, _animated, _stretched, _random_frame)$(13_10)	}$(13_10)	$(13_10)	/// @func set_size(min, max, increase, wobble)$(13_10)	/// @param _min$(13_10)	set_size = function(_min, _max = -999, _increase = 0, _wobble = 0) {$(13_10)		_max = _max == -999 ? _min : _max;$(13_10)		$(13_10)		part_type_size(pt, _min, _max, _increase, _wobble);$(13_10)	}$(13_10)	$(13_10)	/// @func set_color(color_a, color_b, color_c)$(13_10)	/// @desc sets the color of the particle over the lifetime$(13_10)	/// @param _color_a$(13_10)	set_color = function(_color_a, _color_b = -1, _color_c = -1) {$(13_10)		if(_color_c  != -1) {$(13_10)			part_type_color3(pt, _color_a, _color_b, _color_c );$(13_10)		} else if(_color_b != -1) {$(13_10)			part_type_color2(pt, _color_a, _color_b);$(13_10)		} else {$(13_10)			part_type_color1(pt, _color_a);$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	/// @func set_color_mix(color_a, color_b)$(13_10)	/// @desc chooses randomly between two colors$(13_10)	/// @param _color_a$(13_10)	/// @param _color_b$(13_10)	set_color_mix = function(_color_a, _color_b) {$(13_10)		part_type_color_mix(pt, _color_a, _color_b);$(13_10)	}$(13_10)	$(13_10)	/// @func set_alpha(alpha_a, alpha_b, alpha_c)$(13_10)	/// @desc sets the alpha of the particle over the lifetime$(13_10)	/// @param _alpha_a$(13_10)	set_alpha = function(_alpha_a, _alpha_b = -1, _alpha_c = -1) {$(13_10)		if(_alpha_c != -1) {$(13_10)			part_type_alpha3(pt, _alpha_a, _alpha_b, _alpha_c);$(13_10)		} else if(_alpha_b != -1) {$(13_10)			part_type_alpha2(pt, _alpha_a, _alpha_b);$(13_10)		} else {$(13_10)			part_type_alpha1(pt, _alpha_a);$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	/// @func set_life(min, max)$(13_10)	/// @param _min$(13_10)	set_life = function(_min, _max = -999) {$(13_10)		_max = _max == -999 ? _min : _max;$(13_10)		$(13_10)		part_type_life(pt, _min, _max);$(13_10)	}$(13_10)	$(13_10)	/// @func set_direction(min, max, increase, wobble)$(13_10)	/// @param _min$(13_10)	set_direction = function(_min, _max = -999, _increase = 0, _wobble = 0) {$(13_10)		_max = _max == -999 ? _min : _max;$(13_10)		$(13_10)		part_type_direction(pt, _min, _max, _increase, _wobble);$(13_10)	}$(13_10)	$(13_10)	/// @func set_orientation(min, max, increase, wobble, relative)$(13_10)	/// @param _min$(13_10)	set_orientation = function(_min, _max = -999, _increase = 0, _wobble = 0, _relative = true) {$(13_10)		_max = _max == -999 ? _min : _max;$(13_10)		$(13_10)		part_type_orientation(pt, _min, _max, _increase, _wobble, _relative);$(13_10)	}$(13_10)	$(13_10)	/// @func set_speed(min, max, increase, wobble)$(13_10)	/// @param _min$(13_10)	set_speed = function(_min, _max = -999, _increase = 0, _wobble = 0) {$(13_10)		_max = _max == -999 ? _min : _max;$(13_10)		$(13_10)		part_type_speed(pt, _min, _max, _increase, _wobble);$(13_10)	}$(13_10)	$(13_10)	/// @func set_gravity(amount, direction)$(13_10)	/// @param _amount$(13_10)	set_gravity = function(_amount, _direction) {$(13_10)		part_type_gravity(pt, _amount, _direction)$(13_10)	}$(13_10)	$(13_10)	/// @func set_target(target)$(13_10)	/// @desc will allow the particles to automatically follow a target$(13_10)	/// @param _target$(13_10)	set_target = function(_target) {$(13_10)		target_instance = _target$(13_10)	}$(13_10)$(13_10)	/// @func set_offset(x, y)$(13_10)	/// @desc sets the offset to use in the set_target$(13_10)	/// @param _x$(13_10)	/// @param _y$(13_10)	set_offset = function(_x, _y) {$(13_10)		offset._x = _x;$(13_10)		offset._y = _y;$(13_10)		$(13_10)		set_position(x, y);$(13_10)	}$(13_10)	$(13_10)	/// @func set_depth(depth)$(13_10)	/// @param _depth$(13_10)	set_depth = function(_depth) {$(13_10)		part_system_depth(ps, _depth);$(13_10)	}$(13_10)$(13_10)	/// @func set_wobble(amount)$(13_10)	/// @param _amount$(13_10)	set_wobble = function(_amount) {$(13_10)		wobble_amount = _amount;$(13_10)	}$(13_10)	$(13_10)	/// @func set_emitter_size(left, right, top, bottom)$(13_10)	/// @param l left$(13_10)	/// @param r right$(13_10)	/// @param t top$(13_10)	/// @param b bottom$(13_10)	set_emitter_size = function(_l = 0, _r = 0, _t = 0, _b = 0) {$(13_10)		emitter_size._left = _l;$(13_10)		emitter_size._right = _r;$(13_10)		emitter_size._top = _t;$(13_10)		emitter_size._bottom = _b;$(13_10)		$(13_10)		update_emitter();$(13_10)	}$(13_10)	$(13_10)	/// @fund set_emitter_random$(13_10)	/// @desc will randomize the emitter size$(13_10)	/// @param _random$(13_10)	set_emitter_random = function(_random = true) {$(13_10)		emitter_randomize = _random;$(13_10)	}$(13_10)	$(13_10)	set_position = function(_x, _y) {$(13_10)		x = _x + offset._x;$(13_10)		y = _y + offset._y;$(13_10)		$(13_10)		update_emitter();$(13_10)	}$(13_10)	$(13_10)	/// @func set_timer(time)$(13_10)	/// @param _time$(13_10)	set_timer = function(_time) {$(13_10)		alarm_set(0, _time);$(13_10)	}$(13_10)#endregion$(13_10)$(13_10)#region UPDATE FUNCTIONS$(13_10)$(13_10)	/// @func update_emitter$(13_10)	/// @desc updates the emitter's position based on internal values$(13_10)	update_emitter = function() {$(13_10)		if(emitter_randomize) {$(13_10)			part_emitter_region(ps,$(13_10)				pe,$(13_10)				x + random(emitter_size._left),$(13_10)				x + random(emitter_size._right),$(13_10)				y + random(emitter_size._top),$(13_10)				y + random(emitter_size._bottom),$(13_10)				ps_shape_rectangle,$(13_10)				ps_distr_linear$(13_10)			);$(13_10)		} else {$(13_10)			part_emitter_region(ps,$(13_10)				pe,$(13_10)				x + emitter_size._left,$(13_10)				x + emitter_size._right,$(13_10)				y + emitter_size._top,$(13_10)				y + emitter_size._bottom,$(13_10)				ps_shape_rectangle,$(13_10)				ps_distr_linear$(13_10)			);$(13_10)		}$(13_10)	}	$(13_10)	$(13_10)#endregion$(13_10)$(13_10)#region DEFAULT PARTICLE SYSTEM$(13_10)	ps = part_system_create();$(13_10)	pt = part_type_create();$(13_10)	$(13_10)	// set default emitter$(13_10)	pe = part_emitter_create(ps);$(13_10)	part_emitter_region(ps, pe, 0, 1, 0, 1, ps_shape_rectangle, ps_distr_gaussian);$(13_10)	$(13_10)	// setup a default particle$(13_10)	set_blend(true);$(13_10)	set_shape(pt_shape_pixel);$(13_10)	set_size(1, 2);$(13_10)	set_color(c_white);$(13_10)	set_alpha(1, 0);$(13_10)	set_life(20, 60);$(13_10)	set_orientation(90, 90);$(13_10)	set_speed(1, 1.5);$(13_10)	set_position(x, y);$(13_10)#endregion$(13_10)$(13_10)#region PARTICLE$(13_10)	/// @func burst(amount)$(13_10)	/// @desc one time burst$(13_10)	/// @param _amount$(13_10)	burst = function(_amount = 1) {$(13_10)		part_emitter_burst(ps, pe, pt, _amount);$(13_10)	}$(13_10)	$(13_10)	/// @func stream(amount)$(13_10)	/// @desc stream the particles, usually in the create event$(13_10)	/// @param _amount$(13_10)	stream = function(_amount = 1) {$(13_10)		part_emitter_stream(ps, pe, pt, _amount);$(13_10)	}$(13_10)#endregion"
/// @description particle system

randomize();

#region DEFAULT VARIABLES

	target_instance = noone;
	emitter_randomize = false;
	
	emitter_size = {
		_left: 1,
		_right: 1,
		_top: 1,
		_bottom: 1,
	}

	offset = {
		_x: 0,
		_y: 0,
	}

#endregion

#region HELPER 
	/// @func set_blend(blend)
	/// @desc blends the particles together
	/// @param _blend
	set_blend = function(_blend = true) {
		part_type_blend(pt, _blend);
	}
	
	/// @func set_shape(shape)
	/// @param _shape
	set_shape = function(_shape = pt_shape_pixel) {
		part_type_shape(pt, _shape);
	}
	
	/// @func set_sprite(sprite, animated, stretched, random_frame)
	/// @param _sprite
	set_sprite = function(_sprite, _animated = false, _stretched = false, _random_frame = true) {
		part_type_sprite(pt, _sprite, _animated, _stretched, _random_frame)
	}
	
	/// @func set_size(min, max, increase, wobble)
	/// @param _min
	set_size = function(_min, _max = -999, _increase = 0, _wobble = 0) {
		_max = _max == -999 ? _min : _max;
		
		part_type_size(pt, _min, _max, _increase, _wobble);
	}
	
	/// @func set_color(color_a, color_b, color_c)
	/// @desc sets the color of the particle over the lifetime
	/// @param _color_a
	set_color = function(_color_a, _color_b = -1, _color_c = -1) {
		if(_color_c  != -1) {
			part_type_color3(pt, _color_a, _color_b, _color_c );
		} else if(_color_b != -1) {
			part_type_color2(pt, _color_a, _color_b);
		} else {
			part_type_color1(pt, _color_a);
		}
	}
	
	/// @func set_color_mix(color_a, color_b)
	/// @desc chooses randomly between two colors
	/// @param _color_a
	/// @param _color_b
	set_color_mix = function(_color_a, _color_b) {
		part_type_color_mix(pt, _color_a, _color_b);
	}
	
	/// @func set_alpha(alpha_a, alpha_b, alpha_c)
	/// @desc sets the alpha of the particle over the lifetime
	/// @param _alpha_a
	set_alpha = function(_alpha_a, _alpha_b = -1, _alpha_c = -1) {
		if(_alpha_c != -1) {
			part_type_alpha3(pt, _alpha_a, _alpha_b, _alpha_c);
		} else if(_alpha_b != -1) {
			part_type_alpha2(pt, _alpha_a, _alpha_b);
		} else {
			part_type_alpha1(pt, _alpha_a);
		}
	}
	
	/// @func set_life(min, max)
	/// @param _min
	set_life = function(_min, _max = -999) {
		_max = _max == -999 ? _min : _max;
		
		part_type_life(pt, _min, _max);
	}
	
	/// @func set_direction(min, max, increase, wobble)
	/// @param _min
	set_direction = function(_min, _max = -999, _increase = 0, _wobble = 0) {
		_max = _max == -999 ? _min : _max;
		
		part_type_direction(pt, _min, _max, _increase, _wobble);
	}
	
	/// @func set_orientation(min, max, increase, wobble, relative)
	/// @param _min
	set_orientation = function(_min, _max = -999, _increase = 0, _wobble = 0, _relative = true) {
		_max = _max == -999 ? _min : _max;
		
		part_type_orientation(pt, _min, _max, _increase, _wobble, _relative);
	}
	
	/// @func set_speed(min, max, increase, wobble)
	/// @param _min
	set_speed = function(_min, _max = -999, _increase = 0, _wobble = 0) {
		_max = _max == -999 ? _min : _max;
		
		part_type_speed(pt, _min, _max, _increase, _wobble);
	}
	
	/// @func set_gravity(amount, direction)
	/// @param _amount
	set_gravity = function(_amount, _direction) {
		part_type_gravity(pt, _amount, _direction)
	}
	
	/// @func set_target(target)
	/// @desc will allow the particles to automatically follow a target
	/// @param _target
	set_target = function(_target) {
		target_instance = _target
	}

	/// @func set_offset(x, y)
	/// @desc sets the offset to use in the set_target
	/// @param _x
	/// @param _y
	set_offset = function(_x, _y) {
		offset._x = _x;
		offset._y = _y;
		
		set_position(x, y);
	}
	
	/// @func set_depth(depth)
	/// @param _depth
	set_depth = function(_depth) {
		part_system_depth(ps, _depth);
	}

	/// @func set_wobble(amount)
	/// @param _amount
	set_wobble = function(_amount) {
		wobble_amount = _amount;
	}
	
	/// @func set_emitter_size(left, right, top, bottom)
	/// @param l left
	/// @param r right
	/// @param t top
	/// @param b bottom
	set_emitter_size = function(_l = 0, _r = 0, _t = 0, _b = 0) {
		emitter_size._left = _l;
		emitter_size._right = _r;
		emitter_size._top = _t;
		emitter_size._bottom = _b;
		
		update_emitter();
	}
	
	/// @fund set_emitter_random
	/// @desc will randomize the emitter size
	/// @param _random
	set_emitter_random = function(_random = true) {
		emitter_randomize = _random;
	}
	
	set_position = function(_x, _y) {
		x = _x + offset._x;
		y = _y + offset._y;
		
		update_emitter();
	}
	
	/// @func set_timer(time)
	/// @param _time
	set_timer = function(_time) {
		alarm_set(0, _time);
	}
#endregion

#region UPDATE FUNCTIONS

	/// @func update_emitter
	/// @desc updates the emitter's position based on internal values
	update_emitter = function() {
		if(emitter_randomize) {
			part_emitter_region(ps,
				pe,
				x + random(emitter_size._left),
				x + random(emitter_size._right),
				y + random(emitter_size._top),
				y + random(emitter_size._bottom),
				ps_shape_rectangle,
				ps_distr_linear
			);
		} else {
			part_emitter_region(ps,
				pe,
				x + emitter_size._left,
				x + emitter_size._right,
				y + emitter_size._top,
				y + emitter_size._bottom,
				ps_shape_rectangle,
				ps_distr_linear
			);
		}
	}	
	
#endregion

#region DEFAULT PARTICLE SYSTEM
	ps = part_system_create();
	pt = part_type_create();
	
	// set default emitter
	pe = part_emitter_create(ps);
	part_emitter_region(ps, pe, 0, 1, 0, 1, ps_shape_rectangle, ps_distr_gaussian);
	
	// setup a default particle
	set_blend(true);
	set_shape(pt_shape_pixel);
	set_size(1, 2);
	set_color(c_white);
	set_alpha(1, 0);
	set_life(20, 60);
	set_orientation(90, 90);
	set_speed(1, 1.5);
	set_position(x, y);
#endregion

#region PARTICLE
	/// @func burst(amount)
	/// @desc one time burst
	/// @param _amount
	burst = function(_amount = 1) {
		part_emitter_burst(ps, pe, pt, _amount);
	}
	
	/// @func stream(amount)
	/// @desc stream the particles, usually in the create event
	/// @param _amount
	stream = function(_amount = 1) {
		part_emitter_stream(ps, pe, pt, _amount);
	}
#endregion