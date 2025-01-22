#region Position Check
//position check
var _onground = place_meeting(x,y+groundbuffer,oBlock);

//return -1 if wall is on left and 1 if wall is on right for wall jumping
var _onwall = place_meeting(x+1,y,oBlock) - place_meeting(x-1,y,oBlock);

#endregion

#region Button Inputs
//take inputs
var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check_pressed(vk_up);
var _key_jump_held = keyboard_check(vk_up);
var _key_attack = keyboard_check_pressed(vk_space);
var _key_exit = keyboard_check_pressed(vk_escape)
var _restart = keyboard_check_pressed( ord("R") )
var _last = keyboard_check_pressed( ord("L") )


if (_restart){game_restart()};
if(_last){fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y)}
if (_key_exit){game_end();}

#endregion

#region Horizontal Movement

//Wall jump delay (will go down by 1 each frame)
walljumpdelay = max(walljumpdelay-1,0);

//Freezes character until this delay is 0
if (walljumpdelay == 0){

	//Stores Direction (-1 is left, 1 is right, 0 is no movement)
	var _dir = _key_right - _key_left; 
	if (_onwall != 0) && (!_onground){
		_dir = 0;
		
	}
	 

	//calculates horizontal speed (multiply by direction if negative go left if positve go right
	hsp += _dir*accel;

	//slows down character when no direction is pressed 
	if (_dir == 0){
		if (hsp < 0){//slows going left
		    hsp = min(hsp + decel,0);
		} else { //slows going right
			hsp = max(hsp - decel,0); 
		}
	}

	//horizontal movement calculations

	//sets a cap for characters max speed
	hsp = clamp(hsp,-max_hsp,max_hsp);

	//Wall Jump
	if (_onwall != 0) && (!_onground) && (_key_jump) {
		
		walljumpdelay = walljumpdelay_max; //just wall jumped so added delay
	
		hsp = -_onwall * walljumpdistance;
	
		vsp = jumpheight_wall;


	}
}
#endregion




#region Vertical Movement

//vertical movement calculations

//gravity 
var _grav_final = grav; // get grav value from create 
var _grav_max_final = grav_max; // get max value from create

//wall gravity check
if (_onwall !=0) {//check to see if sliding on wall
	if (vsp > 0) {
	_grav_final = grav_wall; //slower slide on wall
	_grav_max_final = grav_max_wall; //slower max slide on wall
	
	}
} else { //if not on a wall aka normal gravity
	_grav_final = grav;
}

vsp += _grav_final;
vsp = clamp(vsp,jumpheight,_grav_max_final);

//ground Jump & coyote time
if (jumpbuffer > 0) { // checks if jb is greater than 0
	jumpbuffer--; //if so reduce jb by 1 
	if(_key_jump) && (vsp > 0){ //if jump is pressed and you are not on the ground 
		jumpbuffer = 0;
		vsp = jumpheight; //jump up
		
		if (!audio_is_playing(jmp)) {
    audio_play_sound(jmp,0,false);	
}
	}
}

if (_onground) jumpbuffer = 10;

//variable jump
if (vsp < 0) && (!_key_jump_held) {
	vsp = max(vsp,jumpheight_min)
}


#endregion

#region Collision Checks
//horizontal collision 
if (place_meeting(x+hsp,y,oBlock)){
	var _this_x = round(x);
	var _pixel = sign(hsp);
	while (!place_meeting(_this_x+_pixel,y,oBlock)) _this_x += _pixel;
	x = _this_x;
	hsp = 0
}

//official movement X
x += hsp;


//vertical collision 
if (place_meeting(x, y+vsp, oBlock)){
	var _this_y = round(y);
	var _pixel = sign(vsp);
	while (!place_meeting(x, _this_y+_pixel,oBlock)) _this_y += _pixel;
	y = _this_y;
	vsp = 0;
}

//official movement Y

y += vsp;
#endregion 

#region Sprites

image_speed = 1; //animation speed 100%

if (hsp != 0) image_xscale = sign(hsp);

if (!_onground) {  //if in the air 
	if (_onwall != 0){ //if in air + touching wall
		sprite_index = sPurpWall;
		image_xscale = _onwall;
	
	}else {
	sprite_index = sPurpAir;
	image_speed = 0;
	image_index = (vsp > 0);
	}
} else { 
	if (hsp != 0) {
		sprite_index = sPurpRun;
	} else {
		sprite_index = sPurp;
	}
}

#endregion



#region Enemies

//Game Over

if (place_meeting(x,y,oHazards)){
	death()
	}

#endregion


#region Attack

if (attack_cooldown > 0) {
	attack_cooldown = max(0,attack_cooldown-1);
} else { 
	if (_key_attack){
		attack_cooldown = attack_timer;
		instance_create_layer(x,y,"Attack", oAttack); 
		
	}
}


#endregion