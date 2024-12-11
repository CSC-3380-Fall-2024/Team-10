/// @description Plays a sound clip with a specified volume and no looping.
/// @param {sound} _clip - The sound asset to be played.
/// @param {float} 10 - The volume at which the sound should play. 10 represents full volume.
/// @param {bool} false - Whether the sound should loop. `false` means the sound will play only once.

function play_sound(_clip) {
    audio_play_sound(_clip, 10, false);  // Play the sound with full volume and no looping
}
