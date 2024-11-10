/// @description Controls and input

if global.race_start
{

acc = (global.accelerate - global.brake) 

steer_dir = (global.right - global.left) 

}

//was
///update movement variables based on keyboard input

//acc = 1 when vk_up is down, acc = -1 when vk_down is down
//acc = keyboard_check(vk_up) - keyboard_check(vk_down);

//steer_dir = 1 when vk_right is down, steer_dir = -1 when vk_left is down
//steer_dir = keyboard_check(vk_right) - keyboard_check(vk_left);
//}

///Drift factor when pressing left or right, and tyre tread marks

if global.race_start and drift_activated = 1 //this can be found in the car inits.  
//For cars without drift, write "drift_activated = 0" in the init for the car type (eg. racingcar_init)
{

if global.left
and phy_speed > 3.2
{
drifting_timer +=1
if drifting_timer > 23 
{
drift -= drift_factor //drift_factor is defined in the car inits (eg. sportscar_init, where it is 0.2)
//engine_acc -= 0.005 //decrease speed
}
}

if global.left
{
have_pressed_left = 1
}

if global.right
{
have_pressed_right = 1
}



if have_pressed_left and  
! global.left
{
have_pressed_left = 0
drifting_timer = 0
}

if have_pressed_right and
! global.right
{
have_pressed_right = 0
drifting_timer = 0
}




if global.right
and phy_speed > 5
{
drifting_timer +=1

if drifting_timer > 23 
{
drift -= drift_factor //this is defined in the car inits (eg. sportscar_init, where it is 0.2, and racingcar_init, where it is 0.1)
//engine_acc -= 0.005 //decrease speed
}
}


if global.left
and phy_speed <= 0.15 //if speed less than or equal to 0.15, then the drift value is the drift default.  Ie. don't drift when speed is that low.
{
drift = drift_default //drift_default is updated in the inits for the car types (eg. sportscar_init).  For the sportscar, the drift default is 2
}

if global.right
and phy_speed <= 0.15  //Ie. don't drift when speed is that low.
{
drift  = drift_default 
}


if drifting_timer = 0 and drift < drift_default //if drift is less than the drift default value, and the car has stopped drifting, the drift will gradually increase until it reaches its default value
{
drift += 0.013  
}

if drift < 0.1 //if drift less than 0.1, drift equals 0.1.  If the drift value goes lower than 0.1, the car glitches when drifting and goes out of control for at least 20 seconds
{
drift = 0.1
}

if drift > drift_default
{
drift = drift_default //ie cap the drift value so that it doesn't go higher than the drift default number (eg. 2 for obj_sportscar, and as defined in the script "sportscar_init)
}

}

//Skidmarks

if global.race_start
{
tyre_rotation = point_direction(0, 0, phy_speed_x, phy_speed_y)

if drift < 0.5 and ! instance_exists (obj_AG_ship) and ! instance_exists (obj_motorbike)  //don't want the floating AG ship to leave skidmarks
{
with instance_create(x,y,obj_tread)
        {
        image_angle = other.tyre_rotation 
        image_xscale = other.phy_speed
        image_alpha = 0.1 
        }
   
                
}
}



///Path points on track


levelPath =  asset_get_index(room_get_name(room)+"A") //eg. Circuit1A.  This is the name of the path

pathN = path_get_number(levelPath); //this obtains the total of number of points in the path

nextP = trackPos+(1/pathN); // 0 + 1/number of points on path.  Eg. 72 points in path.  1/72 = 0.0138
//If there are 20 points in a path, then the car position would increase by 0.05 at every collision point
//It increases as trackPos increases with each collision with the checkpoint.
nextNextP = nextP+(1/pathN);

nextX = path_get_x(levelPath, nextP mod 1);  //the x position of the next path point
nextY = path_get_y(levelPath, nextP mod 1);

//instance_create (nextX, nextY, obj_next) //this object is created as a checkpoint that obj_teleport will follow (and in turn be followed by obj_camera) when the car goes outside the checkpoints and needs to be teleported back

nextNextX = path_get_x(levelPath, nextNextP mod 1);
nextNextY = path_get_y(levelPath, nextNextP mod 1);


if collision_circle(nextX, nextY, 240, id, false, false) //240 is the radius
{
has_collided = 1

trackPos += (1/pathN);  //trackPos is built into var nextP.  So if trackPos increases, nextP increases.    //If there are 20 points in a path, then the car position would increase by 0.05 at every collision point
}
//------------------------------------------------------------------------------------------------------------

//Track lap system 

if global.race_start = true
{

race_progress = trackLap + (pathPos mod 1)  

if race_progress < trackPos then currentPos = race_progress

if race_progress > trackPos then currentPos = trackPos



if (trackPos >=1 and trackPos < 2) and (pathPos >= 0 and pathPos < 0.01) //First lap
{
trackLap = 1
if race_progress < 1
{
race_progress = 1
}
}


if (trackPos >= 2 and trackPos < 3) and (pathPos >= 0 and pathPos < 0.01) //Second lap
{
trackLap = 2
if race_progress < 2
{
race_progress = 2
}
}


if trackPos >= 3 and trackPos < 4 and (pathPos >= 0 and pathPos < 0.01)  //Third lap (if used)
{
trackLap = 3
if race_progress < 3
{
race_progress = 3
}
}


if trackPos >= 4 and trackPos < 5 and (pathPos >= 0 and pathPos < 0.01)  //Fourth lap (if used)
{
trackLap = 4
if race_progress < 4
{
race_progress = 4
}
}


if trackPos >= 5 and trackPos < 6 and (pathPos >= 0 and pathPos < 0.01) //Fifth lap (if used)
{
trackLap = 5
if race_progress < 5
{
race_progress = 5
}
}

}

//End of race


if global.race_end = true
{
acc = 0
final_progress = race_progress
}
//Also see obj_GUI draw 1, and obj_parent_ai step 3 as to when the race ends and the cars stop moving



///Path position and have left path

//Pathpos is used for detecting the car's position on the path ie. relevant for detecting whether a lap has been completed, and a car's position relative to another car
pathPos = scr_path_get_closest_position (levelPath, x, y, 20) 

//IMPORTANT! //the smaller this number (after x, y,), the slower the game runs, as the more precise it is.  
//This number has a big effect on the speed or slowness of the game.
//If modifying this value, you also need to modify the value in obj_parent_ai step event 3

//'levelPath' is defined in obj_car step event 3 

//-------------------------------------------------------------------------------------------------

//This code below is used by for detecting whether the player car has taken a shortcut.  If so, the player teleports back to where it was before the shortcut.
//If this feature is not required, the whole of the below code can be deleted and the game will still work.

if place_meeting (x, y, obj_path) and (trackLap + pathPos) > (trackPos) and have_left_path = 1 //was (trackLap + pathPos) > (trackLap + trackPos) and have_left_path = 1 //if colliding with path and have skipped checkpoint.  Should this be (trackLap + pathPos) and (trackLap + trackPos)?
{
checkpoint_skipped = 1
}

if (trackLap + pathPos) > 0.99
and trackPos < 1 and have_left_path = 1
{
checkpoint_skipped = 1
}

if place_meeting (x, y, obj_path) and (trackLap + pathPos) > (trackPos) and have_left_path = 1 //was (trackLap + pathPos) > (trackLap + trackPos) and have_left_path = 1 //if colliding with path and have skipped checkpoint.  Should this be (trackLap + pathPos) and (trackLap + trackPos)?
{
checkpoint_skipped = 1
}

if (trackLap + pathPos) > 1.99
and trackPos < 2 and have_left_path = 1
{
checkpoint_skipped = 1
}

if (trackLap + pathPos) > 2.99
and trackPos < 3 and have_left_path = 1
{
checkpoint_skipped = 1
}

if (trackLap + pathPos) > 3.99
and trackPos < 4 and have_left_path = 1
{
checkpoint_skipped = 1
}

//Have left path

if !place_meeting (x,y, obj_path) and checkpoint_skipped = 0 //if not colliding with path, leave an object where you left the path.  What is the purpose of checkpoint_skipped = 0? - don't create an object if you are respawning?
{
have_left_path = 1
path_trigger += 1
}

//Create left path object


if path_trigger = 1  //moment in time
{
haveleftpathPos = scr_path_get_closest_position (levelPath, x, y, 10)  //position where you left the path - returns a figure between 0 and 1


if ! instance_exists (obj_left_path)
{
instance_create (x,y,obj_left_path)

obj_left_path.x = path_get_x (levelPath, haveleftpathPos)
obj_left_path.y = path_get_y (levelPath, haveleftpathPos)
}
}


//Returning to the path

if place_meeting (x,y,obj_path) and path_trigger > 0 //if have left the path and are returning to the path
{
path_timer += 1

if path_timer > 30  //slight delay so have_left_path does not instantly return to 0 when hitting the path, so it can tell that you had left the path and are returning to it
{
have_left_path = 0
path_trigger = 0
path_timer = 0
}
}

//Destroy left object if return to path and checkpoint not skipped

if place_meeting (x,y,obj_path) and path_trigger > 0 and checkpoint_skipped = 0
{
if instance_exists (obj_left_path)
{
left_path_destroy_trigger = 1
}

if left_path_destroy_trigger = 1
{
left_path_destroy_timer += 1
}

if left_path_destroy_timer = 30  //Put this on a timer so obj_left_path isn't created and then destroyed too quickly - need it to exist for at least one second otherwise obj_teleport may not be spawned
{
left_path_destroy_trigger = 0
left_path_destroy_timer = 0
with obj_left_path
{
instance_destroy()  //destroy the marker where the car left the path, if a checkpoint has not been skipped
}
}
}

//Teleport if the car misses a checkpoint


if checkpoint_skipped = 1//pathPos < 0.99 and place_meeting (x, y, obj_path) and pathPos > trackPos and have_left_path = 1 //Teleport to previous point if the car goes out of bounds
{
phy_speed_x = 0 //stop car
phy_speed_y = 0
checkpoint_skipped_timer += 1
}

//------------------------------------------------------------------------------




if checkpoint_skipped_timer = 1 
{
nextXpathPos = scr_path_get_closest_position (levelPath, nextX, nextY, 10)  //position where you left the path - returns a figure between 0 and 1


instance_create (x, y, obj_explosion) //create explosion over top of car

if instance_exists (obj_left_path) and haveleftpathPos < nextXpathPos //the leftpath object is created before nextXpathPos
{
instance_create (obj_left_path.x,obj_left_path.y, obj_teleport_target) //obj_left_path is where obj_teleport_target is created
}






if instance_exists (obj_left_path) and haveleftpathPos > nextXpathPos //the leftpath object is created after nextXpathPos  //If you delete this batch of code then there is an error when you collide with the finish line while off the track
{
instance_create (nextX, nextY, obj_teleport_target) //if you were driving down the track the wrong way, you get teleported back to the checkpoint (not where you left the track)
}






if ! instance_exists (obj_left_path) //failsafe if obj_left_path is failed to be created
{
instance_create (nextX, nextY, obj_teleport_target) //nextX and nextY are failsafes
}
}




//--------------------------------------------------------------------------------------------------


if checkpoint_skipped_timer > 0
{
teleport_timer += 1
}

if teleport_timer = 1
{
instance_create (x,y, obj_teleport)
} 

if teleport_timer = 5
{
visible = false
with obj_teleport //see obj_camera which follows obj_teleport when it is created
{
move_towards_point(obj_teleport_target.x, obj_teleport_target.y, 10 ); //the last number is the speed of the teleport object
}
}




if global.teleport_collided = 1
{
switch_camera_trigger = 1
phy_position_x =    obj_teleport.x 
phy_position_y =    obj_teleport.y 
phy_speed_x = 0 //stop car
phy_speed_y = 0
have_left_path = 0 //set this to 0 so that obj_teleport is not spawned again
global.teleport_collided = 0
}





if switch_camera_trigger = 1
{ 
switch_camera_timer += 1
phy_speed_x = 0 //stop car
phy_speed_y = 0
phy_position_x =    obj_teleport.x  //car needs to be in same position as obj_teleport to ensure the camera is smooth
phy_position_y =    obj_teleport.y 
phy_rotation = -point_direction(phy_position_x, phy_position_y,nextNextX,nextNextY)  + 90  //car needs to be rotated towards next checkpoint 
}

if switch_camera_timer = 1
{
if instance_exists (obj_left_path)
{
with obj_left_path
{
instance_destroy()
}
}
}


if switch_camera_timer = 25
{
instance_create (phy_position_x, phy_position_y, obj_smoke) //create smoke over top of car
}



if switch_camera_timer = 50
{
teleport_timer = 0
switch_camera_trigger = 0
switch_camera_timer = 0
phy_active = true  //turning this off and then on again causes the car to rotate once turned on
visible = true
global.collision_timer = 0
checkpoint_skipped = 0
checkpoint_skipped_timer = 0

with obj_teleport_target
{
instance_destroy()
}
}






///Jumping in the air - Z variable
//Also see obj_car create event 4, and obj_car draw event
//The illusion of jumping is achieved by applying an xscale and yscale factor to the draw event of the car, and the draw event of the car's shadow.

// Gravity and such - taking care of z variable
z_spd+=.14 //was .2  //the lower the number like 0.03, the higher the car hangs in the air
z-=z_spd
if z<=0
{z=0;z_spd=-z_spd/2.5}  //was 2.5 - setting this lower than 2.5 allows the car to bounce like a tennis ball on hitting the ground


if place_meeting (x,y,obj_rampstrip) and phy_speed > 7
{
if z=0
{
z_spd=-2 
}
}


