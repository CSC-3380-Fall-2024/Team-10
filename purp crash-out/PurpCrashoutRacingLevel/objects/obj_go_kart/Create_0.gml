/// @description init basic car variables and add wheels

event_inherited()

go_kart_init();

player_car_GUI() //this is for obj_GUI draw event to work

//add wheels
car_add_wheel(-8,-8,true,true,obj_wheel); //top left 
car_add_wheel(8,-8,true,true,obj_wheel);  //top right 
car_add_wheel(-8,10,false,true,obj_wheel); //bottom left 
car_add_wheel(8,10,false,true,obj_wheel);  //bottom right 



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

//obj_GUI values

col_color = c_white;


//Has collided with path

has_collided = 0



///Other values

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

