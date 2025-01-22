/// @description car_ai_move(angle_to,angle_difference,distance)
/// @param angle_to
/// @param angle_difference
/// @param distance
function car_ai_move(argument0, argument1, argument2) {
	//description//
	/*
	    controls how the ai moves and reacts to collisions
	*/

	//arguments//
	var angle_to = argument0, //the angle the car should face
	    angle_d  = argument1, //the difference between current angle and target angle
	    dist     = argument2; //the distance to target
    
	var angle    = -phy_rotation + 90;
    
	//control steering
	steer_dir = angle_d;
    
	//control acceleration
	if(ai_col) {// if there is a collison!
    
	    //get forward axis
	    var nx = lengthdir_x(1,angle);
	    var ny = lengthdir_y(1,angle);
    
	    //project local collision position to foward axis
	    var m = dot_product(nx,ny,ai_col_x,ai_col_y);
    
	    //if projection is positive then we need to reverse
	    if(m > 0 && phy_speed <= 1) //we need to reverse
	        acc = -1;
	    else
	        acc = 1;
    
	}
	else { //go forward
	    if(acc == 0) //if no movement
	        acc = 1; //accelerate!
        
	    if(acc == -1) //are we reversing
	        if(abs(angle_d) <= 3) //should we stop reversing?
	            acc = 1; //accelerate!
	}

	//keep speed down if not facing target!
	if(acc == 1)
	    if(abs(angle_d) > 3 && phy_speed > 2)
	        acc = 0;
            
	//flip steer direction if in reverse
	if(acc == -1)
	    steer_dir *= -1;
    
	//Allow ai to rotate indefinitely. note: non ai cars don't do this!//

	//get needed angular speed
	var angular_d = angle_d * room_speed - phy_angular_velocity;
 
	//allow ai to automatically face target, prevents "wooble"
	if(abs(angle_d) < 3)
	{
	    phy_rotation += angle_d; //directly set phy_rotation
	    phy_angular_velocity = 0; //stop all angular motion
	    angular_d = 0;
	}

	//get factor to limit angular speed
	var factor = max(min(phy_speed/max_speed,1),0.1); 

	//clamp the angular speed
	angular_d = clamp(angular_d,-45 * factor,45 * factor);

	//apply the angular speed
	phy_angular_velocity += angular_d;
    
	//reset ai_col
	ai_col = false;



}
