/// @description car_ai_update()
function car_ai_update() {
	//description//
	/*
	    Updates ai properties and allows ai to move
	*/

	//if no target then
	if(!instance_exists(ai_target)) 
	    car_ai_get_target(); //try to find a target
    
	if(!instance_exists(ai_target)) then exit; //if still no target then exit!

	//AI Setup//


	//default target position
	var tx = ai_target.x;
	var ty = ai_target.y;

	//get forward angle of car
	var angle = -phy_rotation+90;

	//get the angle between ai and target
	var angle_dir = point_direction(x,y,tx,ty);

	//get the angle difference between movement angle and the ai/ai-target angle
	var angle_diff = angle_difference(angle,angle_dir);

	//get the distance to target
	var dist = point_distance(x,y,tx,ty);

	//move the car
	car_ai_move(angle_dir,angle_diff,dist);




}
