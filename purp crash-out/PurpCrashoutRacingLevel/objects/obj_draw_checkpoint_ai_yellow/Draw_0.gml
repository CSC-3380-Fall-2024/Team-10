/// @description Draw collision circle AI (obj_ai_yellow)
/// @param obj_ai_yellow

//Vars
var levelPath = Circuit1A//asset_get_index("path" + string_digits(room_get_name(room)));
var pathWidth = 600
var pathN = path_get_number(levelPath);

//Get next two points on the track
var nextP = obj_ai_yellow.trackPos+(1/pathN);
var nextNextP = nextP+(1/pathN);

var nextX = path_get_x(levelPath, nextP mod 1);  //the current point on the path (x) - if you fall off the track, you can teleport back here (x,y)
var nextY = path_get_y(levelPath, nextP mod 1); //the current point on the path (y)
var nextNextX = path_get_x(levelPath, nextNextP mod 1);
var nextNextY = path_get_y(levelPath, nextNextP mod 1);

//Get the direction from the next point towards its succeeding point
var pathDir = point_direction(nextX, nextY, nextNextX, nextNextY);

//-----------------------------------------

draw_set_color(c_yellow);
//draw_line(nextX1, nextY1, nextX2, nextY2);
draw_circle(nextX, nextY, 240, false);
draw_set_color(-1);

