/// @description Insert description here
// You can write your code in this editor\

/**
 * Creates a music playlist and sets the default song to play.
 * 
 * @param global.music (ds_list) A list that holds the music tracks for the playlist.
 * @param Demorphed (sound) The first track in the playlist.
 * @param NoFlanger (sound) The second track in the playlist.
 * @param global.current_song_index (integer) The index of the current song in the playlist (set to 0 for the first song).
 * @param global.music_volume (float) The default volume for the music, set to 0.5.
 */
 
// Make playlist
global.music = ds_list_create();
ds_list_add(global.music, Demorphed, NoFlanger);
global.current_song_index = 0;

// Play first song
audio_play_sound(global.music[| global.current_song_index], 1, true);

// Set default volume
global.music_volume = .5;
audio_master_gain(global.music_volume);
