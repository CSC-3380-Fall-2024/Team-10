function car_init() {
	//------Edit these values to customize car-------//
	max_speed = 6.7  //MAX SPEED maximum speed car can attain 
	max_speed_rev = 4; //REVERSE maximum speed car can attain reversing

	//these values will largely depends on the density of the car
	engine_acc = 5.5; //ACCELERATION forward force, moving forward
	engine_brk = 6;  //BRAKING  braking force
	engine_rev = 3;  //reverse force, moving backward

	max_wheel_angle = 8;  //STEERING  the maximum angle the wheel can rotate
	wheel_angle_velocity=3; //STEERING how quickly a wheel rotates.  0 is hardly rotates

	//*note: torque can be set to 0, and car will still turn!
	//also angular damping(box2d) greatly affects the turning capacity of the car.
	torque_acc = 5.5;  //lower value is slower turning, higher value is faster turning      //extra torque on the car when turning 
	torque_rev = 7;  //extra torque on the car in reverse
	torque_damp = 1;  //how quickly the car will straighten when not turning
	                        //range: (0-1)
	//-----------------------------------------------------
	//DRIFT
                        
	drift = 1; //drift control, usually between (0-1) but can be higher  //This value for the car (but not the wheel) has been disabled in the code because it causes the cars in collisions to have hardly any weight
	                        //0: no control | 1: high control
                        
	//------Leave these values alone------//
	acc = 0;                //0 - no acceleration, 1 - forward, 2 - reverse
	steer_dir = 0;          //the angle the wheels should be at
	wheels[0] = noone;      //array to hold the wheels






}
