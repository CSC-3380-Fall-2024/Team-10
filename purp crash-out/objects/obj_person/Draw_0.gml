 //draw the sprite
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

//This draws the shadow:
if hit = 0
{
draw_sprite_ext (sprite_index, image_index, x+4, y+5, image_xscale, image_yscale, image_angle, c_black, image_alpha/4)
}

if hit = 1
draw_sprite_ext (sprite_index, image_index, x+2, y+2, image_xscale, image_yscale, image_angle, c_black, image_alpha/4)

