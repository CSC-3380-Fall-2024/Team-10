/// @description Create a boundary around the room
with(instance_create(0,0,obj_solid)) //create a solid parent
{    
    p[0,0] = 0;
    
    //set points for boundary
    p = scr_add_point(p,0,0,0,room_width,0);
    p = scr_add_point(p,1,0,0,0,room_height);
    p = scr_add_point(p,2,0,room_height,room_width,room_height);
    p = scr_add_point(p,3,room_width,0,room_width,room_height);
    
    //create fixture
    fix = physics_fixture_create();
    
    //set fixture shape and bind
    for(var i = 0; i < 4; i++) {
        physics_fixture_set_edge_shape(fix,p[i,0],p[i,1],p[i,2],p[i,3]);
        physics_fixture_bind(fix,id);
    }
    
    //delete fixture to prevent memory leaks
    physics_fixture_delete(fix);
}



///Race start and race end

global.race_start = false
global.race_end = false
//see obj_race_start as to when this turns true

//See obj_GUI draw 1, and obj_car step 3 (bottom of code) and obj_parent_ai step 3 as to when the race ends and the cars stop moving

///Create the player car and other various start up objects
//Also see obj_cs_menu_control alarm [0] which increase the value of global.sportscar etc 
//which triggers this placement of the cars in the room

if global.sportscar = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_sportscar)
}

if global.racingcar = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_racingcar)
}

if global.motorbike = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_motorbike)
}

if global.truck = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_truck)
}

if global.go_kart = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_go_kart)
}

if global.AG_ship = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_AG_ship)
}

if global.rallycar = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_rallycar)
}

if global.tank = 1
{
instance_create (obj_start_lights.x - 45, obj_start_lights.y+240, obj_tank)
}

instance_create (x,y,obj_room_controller) //creates the pause menu controller
//instance_create (x,y, obj_analog_stick) //the purpose of this is to detect if the left stick is held down for drifting - see step event of obj_car
instance_create (x,y, obj_camera)
//instance_create (x,y, obj_car_input) //keyboard and joystick controls
instance_create (x,y, obj_GUI)
instance_create (x,y, obj_path_point_controller)
instance_create (x,y, obj_debug_messages)
instance_create (x,y,obj_race_start) //traffic lights GUI
instance_create (x,y,obj_starting_grid) //creates the ai cars
instance_create (x,y,obj_night)  //creates the car headlights
instance_create (x,y,obj_light_control)  //creates the car headlights

instance_create (x,y,obj_colour_ai)
//Note: If deleting or adding new ai cars manually (ie. if not using obj_starting_grid), to get the colours to work
//you need to delete obj_main in the room editor, and re-place it in the room
//This is because obj_main creates obj_colour_ai, and obj_colour_ai needs to be
//re-created for the colours to work when adding or deleting ai cars


