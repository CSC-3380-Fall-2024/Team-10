//get rid of global. in global.amount currents is prob issue probably have to use something in
//set song in game script probably
is_being_dragged = false;

switch(setting) {
	case "music":
		global.musicVolume = ammount_current;
		
		audio_sound_gain(global.musicVolume, amount_current / 100, 0);
	break;
	case "sound":
	
	break;
}