/// @description Box2D collision and create sparks

if phy_speed > 8
{    
    instance_create ((x+other.x)/2,(y+other.y)/2,obj_sparks)
}

