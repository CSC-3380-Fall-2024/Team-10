/// @description Press the pause button

if room != Car_Select_Menu  //don't want the countdown showing in the menu screens
{
if keyboard_check (vk_escape)  || keyboard_check (vk_backspace) || keyboard_check (vk_f1) || gamepad_button_check(0, gp_start) //see obj_controls //esc, backspace, f1, or start button on controller
{
audio_pause_all()
//audio_pause_sound (snd_engine)
instance_create (x,y,obj_pause_menu_controller);
}
}

