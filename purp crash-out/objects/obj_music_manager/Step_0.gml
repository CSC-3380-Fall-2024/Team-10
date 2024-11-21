/// @description Insert description here
// You can write your code in this editor
var _finalVol = global.musicVolume;
//play song
if songAsset != targetSongAsset
{
	//tell old song to fade out
	if audio_is_playing( songInstance)
	{
		//add arrays to fade out
		array_push( fadeOutInstances, songInstance);
		//add song Inst starting volume
		array_push( fadeOutInstVol, fadeInInstVol);
		//fade out frame
		array_push( fadeOutInstTime, endFadeOutTime);
		//reset song
		songInstance = noone;
		songAsset = noone;
	}
	
	//play the song if old song is done
	if array_length( fadeOutInstances) == 0
	{
if audio_exists( targetSongAsset)
{
	songInstance = audio_play_sound( targetSongAsset, 4, true);
	//song volume starts at 0
	audio_sound_gain( songInstance, 0, 0);
	fadeInInstVol = 0;
}
songAsset = targetSongAsset; 
}
}
//volume control
//main song volume

if audio_is_playing(songInstance)
{
	if startFadeInTime > 0
	{
		if fadeInInstVol < 1 {fadeInInstVol += 1/startFadeInTime;} else fadeInInstVol =1;
	}
	else
	{
		fadeInInstVol = 1;
	}
	audio_sound_gain( songInstance, fadeInInstVol *_finalVol, 0);
}

for( var i = 0; i < array_length(fadeOutInstances); i++)
{
	if fadeOutInstTime[i] > 0
	{
		if fadeOutInstVol[i] > 0 { fadeOutInstVol[i] -= 1/fadeOutInstTime[i]; };
	}
	else 
	{
		fadeOutInstVol[i] = 0;
	}
	
	audio_sound_gain( fadeOutInstances[i], fadeOutInstVol[i] * _finalVol, 0);
	//stop song when at 0
	if fadeOutInstVol[i] <= 0
	{
		if audio_is_playing( fadeOutInstances[i] ) { audio_stop_sound( fadeOutInstances[i] ); };
		array_delete(fadeOutInstances, i, 1);
		array_delete(fadeOutInstVol, i, 1);
		array_delete(fadeOutInstTime, i, 1);
		i--;
	}
}