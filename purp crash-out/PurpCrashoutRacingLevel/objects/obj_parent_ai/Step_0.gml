/// @description Update ai variables

if global.race_start
{

if(active)
    car_ai_update(); //this includes following the ai_target
    
//clip steer_dir to max_angle_turn
steer_dir = clamp(steer_dir,-max_wheel_angle,max_wheel_angle);

}


///Drifting and skidmarks

if global.race_start
{

tyre_rotation = point_direction(0, 0, phy_speed_x, phy_speed_y)  //this is the angle that the car is pointing


var tx = ai_target.x;
var ty = ai_target.y;


//get forward angle of car
var angle = -phy_rotation+90;

//get the angle between ai and target
var angle_dir = point_direction(x,y,tx,ty);

//get the angle difference between movement angle and the ai/ai-target angle
var angle_diff = angle_difference(tyre_rotation,angle_dir); 

//get the distance to target
var dist = point_distance(x,y,tx,ty);


//Skidmarks



if ! instance_exists (obj_ai_AG_ship1) and (angle_diff > 35 or  angle_diff < -35)  //as AG ship is floating

{
with instance_create(x,y,obj_tread)
        {
        image_angle = other.tyre_rotation 
        image_xscale = other.phy_speed
        image_alpha = 0.1 
        }
}

}

///Checkpoint system

//These checkpoints are created as a 'fallback' in the event that the path position exceeds
//the checkpoint.  Obj_GUI draw event draws the position of the cars.


levelPath =  asset_get_index(room_get_name(room)+"A") 

pathPos = scr_path_get_closest_position (levelPath, x, y, 20) //the lower this number, the slower the game runs
//IMPORTANT! //the smaller this number (after x, y,), the slower the game runs, as the more precise it is.  
//This number has a big effect on the speed or slowness of the game.
//If modifying it, you also need to modify it in obj_car, step event 4


pathN = path_get_number(levelPath); //this obtains the total of number of points in the path

nextP = trackPos+(1/pathN); // 0 + 1/number of points on path.  Eg. 72 points in path.  1/72 = 0.0138
//If there are 20 points in a path, then the car position would increase by 0.05 at every collision point
//It increases as trackPos increases with each collision with the checkpoint.
nextNextP = nextP+(1/pathN);

nextX = path_get_x(levelPath, nextP mod 1);  //the x position of the next path point
nextY = path_get_y(levelPath, nextP mod 1);

nextNextX = path_get_x(levelPath, nextNextP mod 1);
nextNextY = path_get_y(levelPath, nextNextP mod 1);


if collision_circle(nextX, nextY, 240, id, false, false) //240 is the radius
{
has_collided = 1

trackPos += (1/pathN);  //trackPos is built into var nextP.  So if trackPos increases, nextP increases.    //If there are 20 points in a path, then the car position would increase by 0.05 at every collision point
}


//Laps and code for obj_gui

if global.race_start = true

{

race_progress = trackLap + (pathPos mod 1)  

if race_progress < trackPos then currentPos = race_progress//if pathPos < trackPos then currentPos = pathPos

if race_progress > trackPos then currentPos = trackPos//if pathPos > trackPos then currentPos = trackPos


if (trackPos >=1 and trackPos < 2) and (pathPos >= 0 and pathPos < 0.01) 
{
trackLap = 1
if race_progress < 1
{
race_progress = 1
}
}


if (trackPos >= 2 and trackPos < 3) and (pathPos >= 0 and pathPos < 0.01)
{
trackLap = 2
if race_progress < 2
{
race_progress = 2
}
}


if trackPos >= 3 and trackPos < 4 and (pathPos >= 0 and pathPos < 0.01)
{
trackLap = 3
if race_progress < 3
{
race_progress = 3
}
}


if trackPos >= 4 and trackPos < 5 and (pathPos >= 0 and pathPos < 0.01)
{
trackLap = 4
if race_progress < 4
{
race_progress = 4
}
}


if trackPos >= 5 and trackPos < 6 and (pathPos >= 0 and pathPos < 0.01)
{
trackLap = 5
if race_progress < 5
{
race_progress = 5
}
}

}

//End of race


if global.race_start = false //obj_parent_player.race_progress >= 2 or obj_parent_ai.race_progress >= 2 
{
acc = 0 //acceleration is zero
}
//Also see obj_GUI draw 1, and obj_car step 3 (bottom of code) as to when the race ends and the cars stop moving


///Following the path target object

//also see obj_target create and step events for assigning the obj_target to the path

if global.race_start
{

if(point_distance(x,y,ai_target.x,ai_target.y)>200) //was 200 //if distance is more than //this number needs to be the same as the number below for point_distance
with ai_target
{
path_speed -= 0.05 //slow the path speed
}
  
if(point_distance(x,y,ai_target.x,ai_target.y)<=200) //was 220 //if distance is less than or equal to 
//IMPORTANT - the greater this number, the more cutting of corners the cars will take and the faster they will go
with ai_target
{
path_speed += 0.5 //increase the path speed
}


}























///Jumping in the air - Z variable

// Gravity and such - taking care of z variable
z_spd+=.14 //was .2  //the lower the number like 0.03, the higher the car hangs in the air
z-=z_spd
if z<=0
{z=0;z_spd=-z_spd/2.5}  //was 2.5 - setting this lower than 2.5 allows the car to bounce like a tennis ball on hitting the ground


if place_meeting (x,y,obj_rampstrip)
{
if z=0
{
z_spd=-2 
}
}


