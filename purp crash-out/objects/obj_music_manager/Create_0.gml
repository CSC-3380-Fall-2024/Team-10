/// @description Insert description here
// You can write your code in this editor
global.musicVolume = 1;
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0;
startFadeInTime = 0
fadeInInstVol = 1; 

//fade music out when done playing
fadeOutInstances = array_create(0); //audio to fade otu
fadeOutInstVol = array_create(0);//volume
fadeOutInstTime = array_create(0);//time for fade out