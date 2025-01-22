///@function        fadeout(target room)
///@param     {index}	 _targetroom
///@param	  {integer}	 _target_x		target x location for player
///@param	  {integer}	 _target_y		target y location for player

function fadeout(_targetroom,_target_x,_target_y){

global.checkpoint_x = _target_x
global.checkpoint_y = _target_y
global.target_x = _target_x
global.target_y = _target_y


if (!instance_exists(oFade)) {
	var _fade = instance_create_layer(0,0,"Player", oFade);
	with(_fade) {
		a = 0;
		fade_out = true; 
		target_room = _targetroom;
		
	}
}
}