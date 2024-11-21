/// @description 

randomize();

image_angle = random(360);
image_xscale = random_range(0.5, 1);
image_yscale = image_xscale;

rotation_speed = random_range(-1, 1);
movement_speed = 3;

hitpoints = 2;

hit = function() {
	hitpoints -= 1;
	
	var instance_particle = instance_find(obj_Particle_Hit, 0);
	if(instance_particle != noone) {
		instance_particle.particle.set_position(x, y);
		instance_particle.particle.burst(1);
	}
	
	play_sound(snd_Hit);
	
	if(hitpoints <= 0) {
		global.current_score += 10;
		
		instance_destroy();
	}
}