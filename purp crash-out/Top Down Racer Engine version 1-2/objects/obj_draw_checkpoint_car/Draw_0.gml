/// @description Draw collision circle - debug


//Vars
var levelPath = Circuit1A//asset_get_index("path" + string_digits(room_get_name(room)));
var pathWidth = 600
var pathN = path_get_number(levelPath);

//Get next two points on the track
var nextP = obj_car.trackPos+(1/pathN);
var nextNextP = nextP+(1/pathN);

var nextX = path_get_x(levelPath, nextP mod 1);  //the current point on the path (x) - if you fall off the track, you can teleport back here (x,y)
var nextY = path_get_y(levelPath, nextP mod 1); //the current point on the path (y)
var nextNextX = path_get_x(levelPath, nextNextP mod 1);
var nextNextY = path_get_y(levelPath, nextNextP mod 1);

//Get the direction from the next point towards its succeeding point
var pathDir = point_direction(nextX, nextY, nextNextX, nextNextY);

//----------------------------------------------
//Draw the collision circle


draw_set_alpha(0.5);
draw_circle(nextX, nextY, 240, false); //was 240
draw_set_alpha(1);

//draw_set_color(c_red);
//draw_circle(nextX, nextY, 240, false);
//draw_set_color(-1);

//------------------------------------------------

//Debug - draw line from car to obj_path

//inst = instance_nearest(o_b2d_car.x, o_b2d_car.y, obj_path);
 
//draw_line(o_b2d_car.x, o_b2d_car.y, inst.x, inst.y);


