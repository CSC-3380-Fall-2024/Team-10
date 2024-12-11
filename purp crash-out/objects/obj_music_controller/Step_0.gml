/**
 * Checks if the current song is finished. If not, it goes to the next song or loops back to the start.
 * 
 * @param global.music (ds_list) The list containing the music tracks for the playlist.
 * @param global.current_song_index (integer) The index of the current song in the playlist.
 * @param global.music_volume (float) The volume level of the music.
 * @param audio_is_playing () Checks if the current song is still playing.
 * @param ds_list_size () Gets the size of the music playlist to loop back to the start when needed.
 */
 
// Check if the current song is done, if not go to the next or loop to start
if (!audio_is_playing(global.music[| global.current_song_index])) {
    // Go to the next song
    global.current_song_index = (global.current_song_index + 1) mod ds_list_size(global.music);
    
    // Play the next song
    audio_play_sound(global.music[| global.current_song_index], 1, true);
    audio_master_gain(global.music_volume);
}

	