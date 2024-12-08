/// @description Handles the boss behavior, including its different states and shooting patterns.
/// @param {int} state - The current state of the boss (e.g., intro, idle, move, etc.).
/// @param {int} state_shot - The current shooting state of the boss (e.g., single shot, line, etc.).
/// @param {float} shot_timer - The cooldown timer for shooting.
/// @param {int} bullet_count - The count of bullets fired in a given shooting pattern.
/// @param {bool} is_moving - Indicates if the boss is currently moving.
/// @param {float} position_next_y - The target y-position for the boss to move to.
switch(state) {
    case BOSS_STATES.intro:
        // Smoothly move the boss to a specific position during the intro phase
        x = lerp(x, 608, 0.02);
        if(floor(x - 608) <= 1) {
            show_debug_message("intro phase 1 done");
            x = 608;
            
            // Gradually fade in the health bar
            health_bar_alpha = lerp(health_bar_alpha, 1, 0.02);
            
            // If health bar is fully visible, switch to idle state
            if(health_bar_alpha >= 0.9) {
                health_bar_alpha = 1;
                state = BOSS_STATES.idle;
            }
        }
    break;

    case BOSS_STATES.idle:
        // Timer countdown in idle state, transition to move state when done
        timer -= 1;
        if(timer <= 0) {
            state = BOSS_STATES.move;
        }
    break;

    case BOSS_STATES.move:
        // Boss starts moving to a random position within specified constraints
        if(!is_moving) {
            position_next_y = random_range(movement_constraints.top, movement_constraints.bottom);
            is_moving = true;
            show_debug_message("moving to new position");
        } else {
            // Move towards the target position and switch back to reset state once reached
            move_towards_point(x, position_next_y, movement_constraints._speed);
            if(distance_to_point(x, position_next_y) <= movement_constraints._speed) {
                speed = 0;
                state = BOSS_STATES.reset;
            }
        }
    break;

    case BOSS_STATES.reset:
        // Reset the moving state and set the timer for the next cycle
        is_moving = false;
        timer = _timer;
        state = BOSS_STATES.idle;
    break;

    case BOSS_STATES.dying:
        // Countdown to death and emit death particles
        timer -= 1;
        if(timer <= 0) {
            state = BOSS_STATES.death;
        }
        
        // Emit death particles randomly around the boss
        particle_death.set_position(x + random_range(-sprite_width, sprite_width), y + random_range(-sprite_height, sprite_height));
        particle_death.burst(3);
    break;

    case BOSS_STATES.death:
        // Destroy the boss instance upon death
        instance_destroy();
    break;
}

/// @description Handles the boss's shooting behavior based on the current shooting state.
/// @param {int} state_shot - The current shooting state of the boss (e.g., single, line, tri, etc.).
/// @param {float} shot_timer - The cooldown timer for shooting.
/// @param {int} bullet_count - The number of bullets fired in a shooting pattern.
switch(state_shot) {
    case BOSS_SHOOTING.none:
        // If not shooting, decrement the shot timer and choose a new shooting pattern
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
        // Fire a single bullet towards the player's position
        var target = instance_find(obj_Player, 0);
        if(target != noone) {
            var pd = point_direction(x, y, target.x, target.y);
            var bullet = instance_create_depth(x, y, depth - 1, obj_Boss_Bullet);
            bullet.direction = pd;
            bullet.image_angle = bullet.direction;
        }
        
        // Reset the shot timer for the next shot
        shot_timer = room_speed * 1;
        state_shot = BOSS_SHOOTING.none;
    break;

    case BOSS_SHOOTING.line:
        // Fire a line of bullets towards the player
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
        // Fire three bullets in a spread pattern towards the player
        shot_timer -= 1;
        if(shot_timer <= 0) {
            if(bullet_count < 3) {
                shot_timer = room_speed * 0.1;
                bullet_count += 1;
                var target = instance_find(obj_Player, 0);
                if(target != noone) {
                    var pd = point_direction(x, y, target.x, target.y);
                    pd -= 15;
                    // Fire three bullets with angles offset by 15 degrees
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
        // Fire random bullets towards the player with slight angle variations
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
