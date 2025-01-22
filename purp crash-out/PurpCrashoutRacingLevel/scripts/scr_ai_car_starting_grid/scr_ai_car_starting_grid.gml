function scr_ai_car_starting_grid() {
	//This script is called by obj_starting_grid, which is created by obj_main
	//It creates random ai cars, which are placed into a grid layout by obj_starting_grid

	//We are going to assign random AI cars, then delete it to avoid a memory leak
	if instance_exists (obj_sportscar)
	{
	list_ai_car = ds_list_create();
	ds_list_add(list_ai_car, obj_ai_sportscar1); //was c_green
	ds_list_add(list_ai_car, obj_ai_sportscar2); 
	ds_list_add(list_ai_car, obj_ai_sportscar3); //was c_yellow
	ds_list_add(list_ai_car, obj_ai_sportscar4);
	ds_list_shuffle(list_ai_car);
	ai_car = other.list_ai_car[| 0];
	ds_list_delete(other.list_ai_car, 0);
	ds_list_destroy(list_ai_car);
	}

	if instance_exists (obj_racingcar)
	{
	list_ai_car = ds_list_create();
	ds_list_add(list_ai_car, obj_ai_racingcar1); 
	ds_list_add(list_ai_car, obj_ai_racingcar2); 
	ds_list_add(list_ai_car, obj_ai_racingcar3); 
	ds_list_add(list_ai_car, obj_ai_racingcar4);
	ds_list_shuffle(list_ai_car);
	ai_car = other.list_ai_car[| 0];
	ds_list_delete(other.list_ai_car, 0);
	ds_list_destroy(list_ai_car);
	}

	if instance_exists (obj_motorbike)
	{
	ai_car = obj_ai_motorbike1
	}

	if instance_exists (obj_go_kart)
	{
	ai_car = obj_ai_go_kart1
	}

	if instance_exists (obj_truck)
	{
	ai_car = obj_ai_truck1
	}

	if instance_exists (obj_AG_ship)
	{
	ai_car = obj_ai_AG_ship1
	}

	if instance_exists (obj_rallycar)
	{
	ai_car = obj_ai_rallycar1
	}

	if instance_exists (obj_tank)
	{
	ai_car = obj_ai_tank1
	}


	//if there is only one car to add, just put ai_car = [insert name of ai car object]



}
