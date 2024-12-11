/// @description Car colour and shadow

//Draw shadow
draw_sprite_ext(sprite_index, 2, x + 19, y + 19, 1, 1, image_angle, c_black, 0.25); //draws the shadow from sprite index 2 at 25% opacity and floating

//Draw coloured kart
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, col_color, 1);  //draws the colour over sprite index 0

//Draw non coloured part of kart
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, 1); //draws the non-coloured parts of the car with sprite index 1


