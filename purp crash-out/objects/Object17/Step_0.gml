/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(global.key_up)){
	y-= 10;
}
if(keyboard_check(global.key_down)){
	 y += 10;
}
if(keyboard_check(global.key_left)){
	x -= 10;
}
if(keyboard_check(global.key_right)){
	x += 10;
}