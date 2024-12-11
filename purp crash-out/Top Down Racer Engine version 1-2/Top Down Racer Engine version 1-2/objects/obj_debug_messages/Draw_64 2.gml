/// @description Debug messages

//--------------------------------------------
draw_set_color(c_white);
draw_set_font(ft_description);
//-----------------------------------------------------


//Draw FPS

draw_text(ww * 0.90,0,string_hash_to_newline("fps: " + string(fps)+"/"+string(room_speed)));

//draw_text(ww * 0.80,0,"obj car max speed" + string(obj_car.max_speed));

//was draw_text(640 - 50,0,"fps: " + string(fps)+"/"+string(room_speed));

//---------------------------

//draw_text (640 - 100,20,"collide" + string(obj_racingcar.collide)); 

//draw_text (640 - 100,40,"ai_collide" + string(obj_ai_racingcar1.collide)); 

//draw_text (640 - 100,20,"levelPath" + string(obj_car.levelPath)); 

///Path position, track position and lap

//draw_text (640 - 100,20," car final progress" + string(obj_car.final_progress)); 

//draw_text (640 - 100,40,"obj car progress" + string(obj_car.race_progress));

//draw_text (640 - 100,60," ai green final progress" + string(obj_ai_green.final_progress)); 

//draw_text (640 - 100,80,"ai green race end" + string(obj_ai_green.race_progress));

//draw_text (640 - 100,100,"global race end" + string(global.race_end)); 

//draw_text (640 - 120,100,"global pos" + string(global.pos)); 

//draw_text (640 - 100,20,"blue lappath" + string(obj_ai_blue.trackLap + obj_ai_blue.pathPos)); 

//draw_text(640 - 100,40,"green lappath" + string(obj_ai_green.trackLap + obj_ai_green.pathPos)); 

//draw_text(640 - 100,60,"yellow lappath" + string(obj_ai_yellow.trackLap + obj_ai_yellow.pathPos)); 

//draw_text(640 - 100,80,"black lappath" + string(obj_ai_black.trackLap + obj_ai_black.pathPos)); 

//draw_text(640 - 100,100,"red lappath" + string(obj_car.trackLap + obj_car.pathPos)); 



//draw_text(640 - 200,20,"blue trackPos" + string(obj_ai_blue.trackPos)); 

//draw_text(640 - 200,40,"green trackPos" + string(obj_ai_green.trackPos)); 

//draw_text(640 - 200,60,"yellow trackPos" + string(obj_ai_yellow.trackPos)); 

//draw_text(640 - 200,80,"black trackPos" + string(obj_ai_black.trackPos)); 

//draw_text(640 - 200,100,"red trackPos" + string(obj_car.trackPos)); 



//draw_text(640 - 300,20,"blue progress" + string(obj_ai_blue.race_progress)); 

//draw_text(640 - 300,40,"green progress" + string(obj_ai_green.race_progress)); 

//draw_text(640 - 300,60,"yellow progress" + string(obj_ai_yellow.race_progress)); 

//draw_text(640 - 300,80,"black progress" + string(obj_ai_black.race_progress)); 

//draw_text(640 - 300,100,"red progress" + string(obj_car.race_progress)); 

//draw_text(640 - 300,120,"red timer" + string(obj_car.progress_timer)); 

//draw_text(640 - 300,140,"red currentpos" + string(obj_car.currentPos)); 

//draw_text(640 - 300,160,"yellow currentpos" + string(obj_ai_yellow.currentPos)); 

//---------------------------------------------------------------------------




//draw_text(640 - 100,20,"tyre_rotation" + string(obj_car.tyre_rotation)); 

//draw_text(640 - 100,40,"phy_rotation" + string(obj_car.phy_rotation)); 

//draw_text(640 - 100,60,"teleport timer" + string(obj_car.teleport_timer)); 

//draw_text(640 - 100,80,"camera target" + string(obj_camera.target)); 

//draw_text(640 - 100,100,"have left path" + string(obj_car.have_left_path)); 

//draw_text(640 - 100,120,"teleport collide" + string(global.teleport_collided)); 

//if instance_exists (obj_teleport)
//{
//draw_text(640 - 100,140,"collision timer" + string(global.collision_timer)); 
//}

//draw_text(640 - 100,180,"trackPos" + string(obj_car.trackPos)); 

//draw_text(640 - 100,200,"Lap + path" + string(obj_car.trackLap + obj_car.pathPos)); 

//draw_text(640 - 100,220,"pathPos" + string(obj_car.pathPos)); 

//--------------------------------------------------------------------


//draw_text(640 - 100,20,"tyre_rotation" + string(obj_car.tyre_rotation)); 

//draw_text(640 - 100,40,"phy_rotation" + string(obj_car.phy_rotation)); 

//draw_text(640 - 100,60,"teleport timer" + string(obj_car.teleport_timer)); 

//draw_text(640 - 100,80,"camera target" + string(obj_camera.target)); 









//draw_text(640 - 100,160,"pathPos" + string(obj_car.pathPos)); 



//draw_text(640 - 100,200,"trackLap" + string(obj_car.trackLap)); 

//draw_text(640 - 100,220,"currentPos" + string(obj_car.currentPos)); 

//draw_text(640 - 100,240,"Lap + track" + string(obj_car.trackLap + obj_car.trackPos)); 





//draw_text(640 - 130,240,"pathPos" + string(obj_car.pathPos)); 

//if instance_exists (obj_tread)
//{
//draw_text(640 - 100,60,"obj_tread angle" + string(obj_tread.image_angle)); 
//}
//draw_text(640 - 100,20,"path_timer" + string(obj_car.path_timer)); 
 
//draw_text(640 - 100,40,"path_trigger" + string(obj_car.path_trigger));  

//draw_text(640 - 100,60,"pathPos" + string(obj_car.pathPos));  

//draw_text(640 - 100,80, "trackPos: " + string(obj_car.trackPos)); //+ "#nLap: " + string(o_b2d_car.trackLap));

//draw_text(640 - 180,100, "obj_ai_yellow.pathPos: " + string(obj_ai_yellow.pathPos));

//draw_text(640 - 180,120, "obj_ai_yellow.trackPos: " + string(obj_ai_yellow.trackPos));

//draw_text(640 - 180,140, "obj_ai_yellow.trackLap: " + string(obj_ai_yellow.trackLap));

//draw_text(640 - 180,160, "ai yellow point_distance: " + string(point_distance(obj_ai_yellow.x, obj_ai_yellow.y, obj_ai_yellow.nextX, obj_ai_yellow.nextY)));

//draw_text(640 - 180,180, "obj_car point_distance: " + string(point_distance(obj_car.x, obj_car.y, obj_car.nextX, obj_car.nextY)));

//-------------------------------------------------------------


//Draw the calculation of nearest path point to car

//var inst = instance_nearest(o_b2d_car.x, o_b2d_car.y, obj_path);   

//draw_text(640 - 400,0,"inst path position" + string(inst.path_position));  




//var car_distance = point_distance (o_b2d_car.x, o_b2d_car.y, nextNextX, nextNextY);

//draw_text(640 - 600,0,"car distance" + string(car_distance));  

//-----------------------------------------------------------------

//draw_text(740 - 600,0,"nextP" + string(nextP));  


//draw_text(640 - 200,0,"have_left_path:" + string(o_b2d_car.have_left_path));

//draw_text_ext(0,0,str,15,300);
//draw fps
//draw_text(640 - 50,0,"fps: " + string(fps)+"/"+string(room_speed));

//draw_text(640 - 200,0,"angle_dif:" + string(o_b2d_car.angle_dif));

//------------------------------------------------------------------------


//draw_text(640 - 200,0,"phy_speed:" + string(o_b2d_car.phy_speed));

//draw_text(540 - 200,0,"drift:" + string(o_b2d_car.drift));


//----------------------------------------------------------------

//draw_text(500 - 200,0,"AI drift:" + string(obj_base.drift));

//draw_text(460 - 200,0,"AI angle diff:" + string(obj_base.angle_diff));


//draw_text (x+15,y+15, "angle_dif" + string(o_b2d_car.angle_dif));

//draw_text (x,y, "phy_rotation" + string(o_b2d_car.phy_rotation));

//draw_text (x+15,y+15, "has collided race one    " + string(global.has_collided_race1));

//------------------------------------------------------------------------------

//draw_text(640 - 200,0,"nextP" + string(nextP));  //value of next checkpoint

//draw_text(540 - 200,0,"nextNextP:" + string(nextNextP)); //value of next next checkpoint

//draw_text(640 - 400,0,"pathN" + string(pathN)); //the total number of points in a path

//draw_text(640 - 600,0,"trackPos" + string(o_b2d_car.trackPos)); 

//draw_text(640 - 100,0,"path position" + string(o_b2d_car.path_position));

//----------------------------------------------------------------------------
/*
//Vars
var levelPath = Circuit1A//asset_get_index("path" + string_digits(room_get_name(room)));
var pathWidth = 600
var pathN = path_get_number(levelPath);

//Get next two points on the track
var nextP = trackPos+(1/pathN);  //was var nextP = obj_car.trackPos+(1/pathN);
var nextNextP = nextP+(1/pathN);

var nextX = path_get_x(levelPath, nextP mod 1);  //the current point on the path (x) - if you fall off the track, you can teleport back here (x,y)
var nextY = path_get_y(levelPath, nextP mod 1); //the current point on the path (y)
var nextNextX = path_get_x(levelPath, nextNextP mod 1);
var nextNextY = path_get_y(levelPath, nextNextP mod 1);

//Get the direction from the next point towards its succeeding point
var pathDir = point_direction(nextX, nextY, nextNextX, nextNextY);


/* */
/*  */
