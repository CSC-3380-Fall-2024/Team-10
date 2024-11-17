/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(room == rm_sound || room = rm_controls)
{
	/**
	if !(instance_exists(Obj_keyController))
	{
		room_goto(rm_Options);
	}
	**/
	room_goto(rm_Options);
}
else
{
	room_goto(rm_MainMenu);
}

