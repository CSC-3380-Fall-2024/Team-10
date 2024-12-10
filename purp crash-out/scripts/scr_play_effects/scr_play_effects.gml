// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_play_effects(){
	audio_play_sound(argument0, 0, false)
	audio_sound_gain(argument0, global.effects_volume, 0);
}
//whenever want to play a effects use scr_play_effects(placeholder) replace whatever sound is called in placeholder