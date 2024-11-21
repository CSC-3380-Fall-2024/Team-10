//This object is essential for the lighting if a dark rectangle is drawn for a night effect.
//It must have a lower depth than the object that draw the "night rectangle" (In this example obj_night)

with(obj_car)
if lights_are_on()
    draw_lights(x+lengthdir_x(-19,-phy_rotation-78),y+lengthdir_y(-19,-phy_rotation-78),x+lengthdir_x(-19,-phy_rotation-100),y+lengthdir_y(-19,-phy_rotation-100),0.30,spr_headlight2)
//0.15 is darker headlight, 0.60 is brighter headlight
       
//light 1 x, light 1 y, light 2 x, light 2 y, intensity out of 1, headlight sprite



