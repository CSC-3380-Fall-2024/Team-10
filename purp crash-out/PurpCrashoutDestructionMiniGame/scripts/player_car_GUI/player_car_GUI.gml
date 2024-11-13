/// @description This script is called in the create event of obj_car
function player_car_GUI() {
	//It is relied upon by each of the ai_cars using event_inherited

	//It is also called in the create event of each of the player cars

	///Car_init and parent_car_types

	///Parent_car_type variable - this is done for obj_gui (draw event)
	//This is used by each of the children objects including player and ai cars

	//See Obj_gui draw event - if (object_index == car_type)  
	//IMPORTANT - this variable is defined in the create event of obj_car, and then each of the children below uses the variable
	//This is done this way because the code won't work simply by referring to the parent, such as obj_parent_player or obj_car. 
	//When done this way, it will say "You came in place", instead of "You came in 5th place"

	//This code is also replicated in the create event of each of the types of the cars as event_inherited is not used


	if instance_exists (obj_sportscar)
	{
	player_car = obj_sportscar
	}

	if instance_exists (obj_racingcar)
	{
	player_car = obj_racingcar
	}


	if instance_exists (obj_motorbike)
	{
	player_car = obj_motorbike
	}


	if instance_exists (obj_AG_ship)
	{
	player_car = obj_AG_ship
	}

	if instance_exists (obj_truck) 
	{
	player_car = obj_truck
	}

	if instance_exists (obj_go_kart) 
	{
	player_car = obj_go_kart
	}

	if instance_exists (obj_rallycar) 
	{
	player_car = obj_rallycar
	}

	if instance_exists (obj_tank) 
	{
	player_car = obj_tank
	}





}
