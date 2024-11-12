/// @description Create a path object at each of the path points

levelPath = asset_get_index(room_get_name(room)+"A") //eg. Circuit1A
pathWidth = 600; //was 200 //Change this to make the path point wider or narrower
pathColor = c_white;

//------------------------------------------------------------------------------
//Creates the path points

var pathSize = path_get_number(levelPath);  //path_get_number returns the number of points on the path
var incr = (1/pathSize)/1; //was 8 //the increments for the path points
for(var i=0; i<=1; i+=incr)
{
    //Vertex
    var px = path_get_x(levelPath, i mod 1); //check every increment up to 1 //px and py are the middle path points //Returns the x position of a coordinate on a path.  0 is the start and 1 is the end.
    var py = path_get_y(levelPath, i mod 1); //check every increment up to 1 

//---------------------------------------------------    
        
   instance_create (px,py, obj_path)     //creates an object at each path point for debugging
   
//---------------------------------------------
    

    var pnext = (i+incr) mod 1;

var pxn = path_get_x(levelPath, pnext);
var pyn = path_get_y(levelPath, pnext);
var pdir = point_direction(px, py, pxn, pyn);
        
    var px1 = px + lengthdir_x(pathWidth/2, pdir-90); //px1 etc are the edge points of the path - one edge (-90)
    var py1 = py + lengthdir_y(pathWidth/2, pdir-90);
    var px2 = px + lengthdir_x(pathWidth/2, pdir+90); //the other edge (+90)
    var py2 = py + lengthdir_y(pathWidth/2, pdir+90);
}


