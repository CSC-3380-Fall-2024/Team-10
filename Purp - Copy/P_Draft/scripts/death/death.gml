
function death(){
	
if (!audio_is_playing(oof)) {
    audio_play_sound(oof,1,false);	
}	

screenshake(12,30);

	
fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y);
	

	
}