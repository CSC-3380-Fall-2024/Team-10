//-------------------------------------------------

if gamepad_axis_value(0, gp_axislv) <= -.5 { //Press up
    keyboard_key_press(ord("W"));
} else { keyboard_key_release(ord("W"));}

if gamepad_axis_value(0, gp_axislv) >= .5 { //Press down
    keyboard_key_press(ord("S"));
} else { keyboard_key_release(ord("S"));}

if gamepad_axis_value(0, gp_axislh) <= -.5 { //Press left
    keyboard_key_press(ord("A"));
} else { keyboard_key_release(ord("A"));}

if gamepad_axis_value(0, gp_axislh) >= .5 { //Press right
    keyboard_key_press(ord("D"));
} else { keyboard_key_release(ord("D"));}

//--------------------------------------------------------------


//Pause guide here: https://developer.amazon.com/blogs/appstore/post/35ad26c8-95df-4033-8a58-70276d1dbe8d/gamemaker-basics-pause-and-unpause




if global.enter //keyboard_check(vk_enter) || gamepad_button_check(0, gp_face1) || gamepad_button_check_pressed (0, gp_face1)  //A button 
{
alarm[0] = 2 //the various steps
}

if global.down //keyboard_check(vk_down) ||  keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0.5) //gamepad_button_check_pressed(0, gp_padd)  //down button
{
global.pause_menu+=1
// Restart the process
if global.pause_menu > 3 then {global.pause_menu = 1}
}


if global.up //keyboard_check(vk_up) ||  keyboard_check(ord("W")) ||  gamepad_button_check(0, gp_padu) || (gamepad_axis_value(0, gp_axislv) < -0.5) //gamepad_button_check_pressed(0, gp_padu)  //up button
{
global.pause_menu-=1
// Restart the process
if global.pause_menu < 1 then {global.pause_menu = 3}        //loop
}




