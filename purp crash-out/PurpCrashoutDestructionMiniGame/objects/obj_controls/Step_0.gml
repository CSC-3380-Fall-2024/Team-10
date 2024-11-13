

//--------------------------------------------------------------

globalvar accelerate
globalvar brake
globalvar left
globalvar right

globalvar up
globalvar down
globalvar enter
globalvar back
globalvar start
globalvar paused
//--------------------------------------------------------------------------------------------

//Car controls

global.accelerate = keyboard_check(vk_up) ||  keyboard_check(ord("W")) ||    
keyboard_check(vk_enter) || keyboard_check(vk_shift) ||  
keyboard_check(vk_alt) || keyboard_check(vk_control) ||  keyboard_check(vk_space) ||  
gamepad_button_check(0, gp_padu) ||  gamepad_button_check(0, gp_face1) ||  
(gamepad_axis_value(0, gp_axislv) < -0.5) || gamepad_button_value(0, gp_shoulderrb)
//Up arrow, W, control, space, enter, shift, alt, Dpad up, cross button, right trigger

global.brake = keyboard_check(vk_down) ||  keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd) ||  gamepad_button_check (0, gp_face2)  || (gamepad_axis_value(0, gp_axislv) > 0.5) || gamepad_button_value(0, gp_shoulderlb)
//Down arrow, S, Dpad down, circle button, left trigger

global.left = keyboard_check(vk_left) || keyboard_check(ord("A")) ||  gamepad_button_check(0, gp_padl) ||  (gamepad_axis_value(0, gp_axislh) < -0.5)  
//Left arrow, A, dpad left, stick left

global.right = keyboard_check(vk_right) || keyboard_check(ord("D")) || (gamepad_button_check(0, gp_padr)) || (gamepad_axis_value(0, gp_axislh) > 0.5) 
// Right arrow, D, dpad right, stick right

//----------------------------------


//Menu controls

global.up = keyboard_check_pressed(vk_up) ||  keyboard_check_pressed (ord("W")) ||  gamepad_button_check_pressed (0, gp_padu) //|| (gamepad_axis_value(0, gp_axislv) < -0.5) 

global.down = keyboard_check_pressed (vk_down) ||  keyboard_check_pressed (ord("S")) || gamepad_button_check_pressed (0, gp_padd) //|| (gamepad_axis_value(0, gp_axislv) > 0.5) 

global.enter = keyboard_check_pressed (vk_enter) || gamepad_button_check_pressed (0, gp_face1) 
//enter, cross button 

global.back = keyboard_check_pressed (vk_escape)  || keyboard_check_pressed (vk_backspace) || gamepad_button_check_pressed (0, gp_face2)
//escape, backspace, circle button

global.paused = keyboard_check_pressed (vk_escape)  || keyboard_check_pressed (vk_backspace) || keyboard_check_pressed (vk_f1) || gamepad_button_check_pressed(0, gp_start)
//start button = relevant for pause menu



