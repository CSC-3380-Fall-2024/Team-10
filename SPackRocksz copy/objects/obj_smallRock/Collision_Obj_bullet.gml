instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1, c_purple);

direction = random(360);

audio_play_sound(snd_rockdestroy, 0, false, 1, 0, random_range(0.3, 0.7)); 

Obj_game.points += 25;

if instance_number(Obj_rock) < 12
{
	sprite_index = spr_rock_big;
	x = -100; 
}

else 
{
	instance_destroy();
	
}

 