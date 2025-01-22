/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !(instance_exists(obj_keyController))
{
	var a = instance_create(room_width/2, room_height/2,obj_keyController);
	a.purpose = "left";
}

