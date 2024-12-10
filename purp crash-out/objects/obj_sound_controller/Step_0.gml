/// @description Insert description here
// You can write your code in this editor
 //chick if current song is dont if not go to next or loop to start
 if(!audio_is_playing(global.music [| global.current_song_index]))
 {
	 //goes to next song
	 global.current_song_index = (global.current_song_index + 1) mod ds_list_size(global.music)
	 
	 //play next song
	 audio_play_sound(global.music[| global.current_song_index], 1, true);
	 audio_master_gain(global.music_volume);
 }
	