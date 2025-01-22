function car_ai_init() {
	//the AI's target object
	ai_target = noone; 

	//add a path for the ai
	ai_path = path_add(); 

	//collision information
	ai_col = false;
	ai_col_x = 0;
	ai_col_y = 0;

	//whether the ai is on or not
	active = true;





}
