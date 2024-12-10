/// @description Insert description here
// You can write your code in this editor\

//make playlist
global.music = ds_list_create();
ds_list_add(global.music, Demorphed, NoFlanger);
global.current_song_index = 0;

//play first song
audio_play_sound(global.music[| global.current_song_index], 1, true);

//set default volume
global.music_volume = .5;
audio_master_gain(global.music_volume);

//effects vvv
/**when get actual effects replace snd_effects with what they are called
global.effects_volume = .5;
audio_play_sound(snd_effects, 0, false);
audio_sound_gain(snd_effectrs, global.effects_volume, 0);