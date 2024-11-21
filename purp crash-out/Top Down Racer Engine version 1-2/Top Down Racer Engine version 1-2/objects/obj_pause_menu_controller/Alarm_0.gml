if global.pause_menu = 1 //Continue
then  
{
physics_pause_enable(false)
instance_activate_all()
//audio_resume_all()
if(sprite_exists(screenShot)){sprite_delete(screenShot);}
instance_destroy (obj_continue)
instance_destroy (obj_restart)
instance_destroy (obj_exit)
instance_destroy (obj_pause_header)
instance_destroy (obj_pause_menu_controller)
}


if global.pause_menu = 2 //Restart
then
{
//audio_stop_all()
instance_activate_object (obj_controls) //the inputs to control the game

if(sprite_exists(screenShot)){sprite_delete(screenShot);}
instance_destroy (obj_continue)
instance_destroy (obj_restart)
instance_destroy (obj_exit)
instance_destroy (obj_pause_header)
room_restart()
instance_destroy (obj_pause_menu_controller)
}

if global.pause_menu = 3 //Exit
then 
{

instance_activate_object (obj_controls) //the inputs to control the game
//audio_stop_all()
//audio_group_unload (sounds) //unloads the sound effects
if(sprite_exists(screenShot)){sprite_delete(screenShot);}
instance_destroy (obj_continue)
instance_destroy (obj_restart)
instance_destroy (obj_exit)
instance_destroy (obj_pause_header)
instance_destroy (obj_pause_menu_controller)

room_goto(Car_Select_Menu);
}


