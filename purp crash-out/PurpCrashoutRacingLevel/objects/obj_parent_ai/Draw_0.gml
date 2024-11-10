/// @description Draw, car colour and shadow, including jumping

//Draw shadow
draw_sprite_ext(sprite_index, 2 ,x+2-z*5,y+2+z*5,image_xscale-z/40,image_yscale-z/40,image_angle,c_black,image_alpha/4) //draw the shadow 
//the z factor relates to the image_xscale and yscale increasing when you go over a jump to give the illusion of being closer to the camera
//the number after sprite_index is the image_index ie. there are three images within the sprite.
//the first image (0) is the coloured part of the kart
//the second image (1) is the non-coloured part of the kart
//the third image (2) is the shadow of the kart

//Draw coloured kart
draw_sprite_ext(sprite_index, 0, x, y, image_xscale+z/10, -(image_yscale+z/10), image_angle-180, col_color, 1);  //draws the colour over sprite index 0

//Draw non coloured part of kart
draw_sprite_ext(sprite_index, 1, x, y, image_xscale+z/10, -(image_yscale+z/10), image_angle-180, c_white, 1); //draws the non-coloured parts of the car with sprite index 1


