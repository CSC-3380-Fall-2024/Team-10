/// @description Draw car and shadow, including when jumping


draw_sprite_ext(sprite_index,image_index,x+2-z*5,y+2+z*5,image_xscale-z/40,image_yscale-z/40,image_angle,c_black,image_alpha/4) //draw the shadow 
//the z factor relates to the image_xscale and yscale increasing when you go over a jump to give the illusion of being closer to the camera

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale+z/10,-(image_yscale+z/10),image_angle-180,c_white,1)  //draw the sprite //to make the car transparent,change the last figure to 0.3



