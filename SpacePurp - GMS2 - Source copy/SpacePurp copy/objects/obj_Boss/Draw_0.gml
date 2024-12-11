/// @description 

draw_self();

var amount = (hitpoints / _hitpoints) * 100;

draw_set_alpha(health_bar_alpha);
draw_healthbar(
	x - width_half,
	y - sprite_height,
	x + width_half,
	y - sprite_height - 4,
	amount,
	c_black,
	c_red,
	c_green,
	0,
	true,
	true
);

draw_set_alpha(1);