/// @description Player car GUI script

///Parent_car_type variable - this is done for obj_gui (draw event)
//This is used by each of the children objects including player and ai cars

//See Obj_gui draw event - if (object_index == car_type)  
//IMPORTANT - this variable is defined in the create event of obj_car, and then each of the children below uses the variable
//This is done this way because the code won't work simply by referring to the parent, such as obj_parent_player or obj_car. 
//When done this way, it will say "You came in place", instead of "You came in 5th place"

//This code is also replicated in the create event of each of the types of the cars as event_inherited is not used

player_car_GUI()

GUIfullscreen() 

///Track position, drift trigger, GUI values and path values 

//Track Position

trackPos = 0;
trackLap = 0;

//Path position and have_left_path

pathPos = 0
currentPos = 0
have_left_path = 0
path_trigger = 0
path_timer = 0

//Drift trigger

drift_trigger = 0
drifting_timer = 0


path_start (asset_get_index(room_get_name(room)+"A"), 1, path_action_continue, false);


//Has collided with path

has_collided = 0



///Checkpoint variables

levelPath = 0
pathN = 0
nextP = 0
nextNextP = 0
nextX = 0
nextY = 0
nextNextX = 0
nextNextY = 0



///Other values

drift_activated = 0 //see step 2 of obj_car for drifting. See also the init scripts for the different car types as to when this is set to 1
drift_default = 0

kill_sideways_speed = 0 //see script 'car_update' script 'kill_sideways_speed' and the init scripts for the different car types (eg. sportscar_init)

lights = 0  //see scripts 'lights_are_on', 'lights_on', 'lights_off' and 'draw_lights'

z=0                     //for when car is in the air or above other objects. See step event 5, and draw event 
z_spd=0

have_pressed_left = 0 //this is for step 2 of obj_car when pressing left or right to drift
have_pressed_right = 0



tyre_rotation = 0 

teleport = 0

teleport_timer = 0

global.teleport_collided = 0

switch_camera_trigger = 0

switch_camera_timer = 0

checkpoint_skipped = 0

checkpoint_skipped_timer = 0

haveleftpathPos = 0

left_path_destroy_trigger = 0

left_path_destroy_timer = 0

capped_pathPos = 0

lap_complete = 0

lap_complete_timer = 0

race_progress = 0

progress_trigger = 0

progress_timer = 0

final_progress = 0

axisvalue = 0

