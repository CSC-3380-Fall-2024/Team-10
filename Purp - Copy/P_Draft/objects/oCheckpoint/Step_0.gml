//change sprite if flag is checked 

if (global.checkpoint_id = id){
	sprite_index = sCheckd

} else {
	sprite_index = sCheck;
	
	if (place_meeting(x,y,oPlayer1)){
		global.checkpoint_room = room;
		global.checkpoint_x = x;
		global.checkpoint_y = y;
		global.checkpoint_id = id;
		global.target_x = x;
		global.target_y = y;

	if (!audio_is_playing(ckp)) {
    audio_play_sound(ckp,1,false);	
}

	
	
	}
}