

key_timer += 1

if key_timer > 60
{

if global.up //See obj_menu_keys for these values
{
global.cs_menu-=1
// Restart the process
if global.cs_menu < 1 then {global.cs_menu = 8}        //loop
}

if global.down //See obj_menu_keys for these values
{
global.cs_menu+=1
// Restart the process
if global.cs_menu > 8 then {global.cs_menu = 1}
}

if global.enter //See obj_menu_keys for these values
{
alarm[0] = 2
}

if global.back  //See obj_menu_keys for these values
{
game_end()
//room_goto (title_screen)
}

}

//-------------------------------------------------
//This makes the analog stick act like a keyboard input for the menu
//So it is nice and snappy


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


