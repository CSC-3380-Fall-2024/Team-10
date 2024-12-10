time_left -= 1 / room_speed; 

if(time_left <= 0 ) {
	show_message("Time's up! Final Score " + string(global.score)); 
	game_restart();
}