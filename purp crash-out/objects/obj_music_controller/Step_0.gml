/// @description Insert description here
// You can write your code in this editor
/**
 * Checks if the current song is finished, and if not, moves to the next song or loops back to the start.
 * 
 * @param global.music (ds_list) A list containing the music tracks in the playlist.
 * @param global.current_song_index (integer) The index of the current song in the playlist.
 * @param global.music_volume (float) The volume of the music.
 */
 
// Check if current song is done, if not go to next or loop to start
if (!audio_is_playing(global.music[| global.current_song_index])) {
    // Goes to next song
    global.current_song_index = (global.current_song_index + 1) mod ds_list_size(global.music);
    
    // Play next song
    audio_play_sound(global.music[| global.current_song_index], 1, true);
    audio_master_gain(global.music_volume);
}
