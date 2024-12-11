image_speed=.100  
friction = 0.45 

if hit >= 1
{
sprite_index = spr_person_lying
image_speed = .075 
}

if hit=0
{
image_angle=point_direction(x,y,obj_parent_player.x,obj_parent_player.y)
}

if(point_distance(x,y,obj_parent_player.x,obj_parent_player.y)<90) and hit=0   //if car is within 90 pixels
{
sprite_index = spr_person_running
//direction=point_direction(x,y,obj_parent_player.x,obj_parent_player.y)
//image_angle = direction //- 180
//phy_speed_x = 1.5
//phy_speed_y  = 1.5


var_dir = point_direction(x,y,other.x,other.y)
x = x+lengthdir_x(-1,var_dir)
y = y+lengthdir_y(-1,var_dir)
}

if phy_speed = 0 and sprite_index = spr_person_running
{
sprite_index = spr_person_standing
//image_angle=point_direction(x,y,obj_parent_player.x,obj_parent_player.y)
}


