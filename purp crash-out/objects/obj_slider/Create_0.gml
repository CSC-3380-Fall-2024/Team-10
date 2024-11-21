/// @description Insert description here
// You can write your code in this editor
cursor = cr_none;

amount_max = 100;

is_being_dragged = false;

switch(setting){
	case "music":
		global.amount_current = global.musicVolume;
	break;
	case "sound":
		global.amount_current = global.EffectsVolume;
	break;
}

