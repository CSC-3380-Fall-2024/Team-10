/// @description 

switch(state) {
	case BOSS_STATES.intro:
		x = lerp(x, 608, 0.02);
		if(floor(x - 608) <= 1) {
			show_debug_message("intro phase 1 done");
			
			x = 608;
			
			// health bar fade in
			health_bar_alpha = lerp(health_bar_alpha, 1, 0.02);
			
			if(health_bar_alpha >= 0.9) {
				health_bar_alpha = 1;
				state = BOSS_STATES.idle;
			}
		}
	break;
	case BOSS_STATES.idle:
		timer -= 1;
		
		if(timer <= 0) {
			state = BOSS_STATES.move;
		}
	break;
	case BOSS_STATES.move:
		if(is_moving == false) {
			position_next_y = random_range(movement_constraints.top, movement_constraints.bottom);
			is_moving = true;
			
			show_debug_message("moving to new position");
		} else {
			move_towards_point(x, position_next_y, movement_constraints._speed);
			
			if(distance_to_point(x, position_next_y) <= movement_constraints._speed) {
				speed = 0;
				state = BOSS_STATES.reset;
			}
		}
	break;
	case BOSS_STATES.reset:
		is_moving = false;
		timer = _timer;
		state = BOSS_STATES.idle;
	break;
	case BOSS_STATES.dying:
		timer -= 1;
		
		if(timer <= 0) {
			state = BOSS_STATES.death;
		}
		
		particle_death.set_position(x + random_range(-sprite_width, sprite_width), y + random_range(-sprite_height, sprite_height));
		particle_death.burst(3);
	break;
	case BOSS_STATES.death:
		instance_destroy();
	break;
}

switch(state_shot) {
	case BOSS_SHOOTING.none:
		if(state != BOSS_STATES.intro && state != BOSS_STATES.dying && state != BOSS_STATES.death) {
			
			shot_timer -= 1;
		
			if(shot_timer <= 0) {
				bullet_count = 0;
			
				state_shot = choose(BOSS_SHOOTING.single, BOSS_SHOOTING.line, BOSS_SHOOTING.tri, BOSS_SHOOTING.rand);
				
				switch(state_shot) {
					case BOSS_SHOOTING.line:
					case BOSS_SHOOTING.tri:
					case BOSS_SHOOTING.rand:
						shot_timer = room_speed * 0.2;
					break;
				}
			}
		}
	break;
	case BOSS_SHOOTING.single:
		var target = instance_find(obj_Player, 0);
		if(target != noone) {
			var pd = point_direction(x, y, target.x, target.y);
			var bullet = instance_create_depth(x, y, depth - 1, obj_Boss_Bullet);
			bullet.direction = pd;
			bullet.image_angle = bullet.direction;
		}
		
		// short timer
		shot_timer = room_speed * 1;
		state_shot = BOSS_SHOOTING.none;
	break;
	case BOSS_SHOOTING.line:
		shot_timer -= 1;
		
		if(shot_timer <= 0) {
			if(bullet_count < 5) {
				shot_timer = room_speed * 0.1;
				bullet_count += 1;
				
				var target = instance_find(obj_Player, 0);
				if(target != noone) {
					var pd = point_direction(x, y, target.x, target.y);
					
					var bullet = instance_create_depth(x, y, depth - 1, obj_Boss_Bullet);
					bullet.direction = pd;
					bullet.image_angle = bullet.direction;
				}
			} else {
				state_shot = BOSS_SHOOTING.none;
				shot_timer = room_speed * 2;
			}
		}
	break;
	case BOSS_SHOOTING.tri:
		shot_timer -= 1;
		
		if(shot_timer <= 0) {
			if(bullet_count < 3) {
				shot_timer = room_speed * 0.1;
				bullet_count += 1;
	
				var target = instance_find(obj_Player, 0);
				if(target != noone) {
					var pd = point_direction(x, y, target.x, target.y);
					pd -= 15;
					// fire three bullets
					for(var bullet_index = 0; bullet_index < 3; bullet_index ++) {
						var bullet = instance_create_depth(x, y, depth - 1, obj_Boss_Bullet);
						bullet.direction = pd + (15 * bullet_index);
						bullet.image_angle = bullet.direction;
					}
				}
			} else {
				state_shot = BOSS_SHOOTING.none;
				shot_timer = room_speed * 2;
			}
		}
	break;
	case BOSS_SHOOTING.rand:
		shot_timer -= 1;
		
		if(shot_timer <= 0) {
			if(bullet_count < 20) {
				shot_timer = room_speed * 0.1;
				bullet_count += 1;
				
				var target = instance_find(obj_Player, 0);
				if(target != noone) {
					var pd = point_direction(x, y, target.x, target.y);
					
					var bullet = instance_create_depth(x, y, depth - 1, obj_Boss_Bullet);
					bullet.direction = pd - random_range(-25, 25);
					bullet.image_angle = bullet.direction;
				}
			} else {
				state_shot = BOSS_SHOOTING.none;
				shot_timer = room_speed * 2;
			}
		}
	break;
}