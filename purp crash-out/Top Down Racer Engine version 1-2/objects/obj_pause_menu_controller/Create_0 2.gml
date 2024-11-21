/// @description Pause guide here: https://developer.amazon.com/blogs/appstore/post/35ad26c8-95df-4033-8a58-70276d1dbe8d/gamemaker-basics-pause-and-unpause

physics_pause_enable(true)

instance_deactivate_all(true)


global.pause_menu = 1

instance_create (x,y,obj_pause_header);

instance_create (x,y,obj_continue);

instance_create (x,y,obj_restart);

instance_create (x,y,obj_exit);

instance_activate_object (obj_controls)  //so you can control the menu


paused = false;
screenShot = -1;

if(!sprite_exists(screenShot)){screenShot = sprite_create_from_surface(application_surface,0,0,__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ),0,0,0,0)}  




