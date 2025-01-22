function draw_lights(argument0, argument1, argument2, argument3, argument4, argument5) {
	//draw the headlights


	draw_set_blend_mode(bm_add)//set the blend mode

	//draw the headlights
	draw_sprite_ext(argument5,-1,argument0,argument1,1,1,-phy_rotation+12.5,c_white,argument4) //was draw_sprite_ext(argument5,-1,argument0,argument1,1,1,-phy_rotation+5,c_white,argument4)
	draw_sprite_ext(argument5,-1,argument2,argument3,1,1,-phy_rotation+347.5,c_white,argument4) //was draw_sprite_ext(argument5,-1,argument2,argument3,1,1,-phy_rotation+355,c_white,argument4)

	//default the blend mode
	draw_set_blend_mode(bm_normal)



}
