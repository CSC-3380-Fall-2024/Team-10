if (Obj_game.powerup_time < 0)
{
	var _obj = choose(obj_powerup_ghost, obj_powerup_spread);
	instance_create_layer(x, y, "Instances", _obj); 
	Obj_game.powerup_time = 20; 
}

audio_play_sound(snd_rockdestroy, 0, false, 2, 0, random_range(0.6, 1.1)); 

instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1, c_purple);

direction = random(360);

Obj_game.points += 50;

if (sprite_index == spr_rock_big)
{
	sprite_index = spr_rock_small; 
	image_index = 0; 
	
	instance_copy(true); 

}

else if instance_number(Obj_rock) < 12
{
	sprite_index = spr_rock_big;
	x = -100; 
	image_index = 0; 
}

else 
{
	instance_destroy();
}

 