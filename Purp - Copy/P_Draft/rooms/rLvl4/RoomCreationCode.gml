roomcode();

if (audio_is_playing(sndM1)) {
	audio_stop_sound(sndM1);
    audio_play_sound(sndM2,1,true);	

}