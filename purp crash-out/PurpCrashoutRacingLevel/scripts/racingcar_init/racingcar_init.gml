function racingcar_init() {


	//For racing car, have high acceleration, high torque acc and medium wheel angle velocity
	//and low density


	//------Edit these values to customize car-------//

	//DRIFT

	kill_sideways_speed = 1 //see script 'car_update'.  This kills the lateral velocity of the car so it is more 'on rails' and doesn't slide around like a bar of soap                        
	drift_activated = 1 //See step 2 of obj_car, which activates drifting when holding left or right on the controller
	drift = 2; //drift control, usually between (0-1) but can be higher  //This value for the car (but not the wheel) has been disabled in the code because it causes the cars in collisions to have hardly any weight
	                        //0: no control | 1: high control
	drift_default = 2 //same number as above.  See step 2 of obj_car which returns the drift back to this default number after drifting                        
	drift_factor = 0.1 //see step 2 of obj_car, where this drift factor increases when holding left or right


	max_speed = 11.8 //MAX SPEED maximum speed car can attain 
	max_speed_rev = 6; //REVERSE maximum speed car can attain reversing

	//these values will largely depends on the density of the car
	engine_acc = 15; //ACCELERATION forward force, moving forward
	engine_brk = 6;  //BRAKING  braking force
	engine_rev = 3;  //reverse force, moving backward

	max_wheel_angle = 30 //STEERING  the maximum angle the wheel can rotate
	wheel_angle_velocity=9; //was 9 //STEERING how quickly a wheel rotates.  0 is hardly rotates

	//*note: torque can be set to 0, and car will still turn!
	//also angular damping(box2d) greatly affects the turning capacity of the car.
	torque_acc = 12;  //was 12 //lower value is slower turning, higher value is faster turning      //extra torque on the car when turning 
	torque_rev = 0;  //extra torque on the car in reverse
	torque_damp = 0;  //how quickly the car will straighten when not turning
	                        //range: (0-1)
	//-----------------------------------------------------

                        
	//------Leave these values alone------//
	acc = 0;                //0 - no acceleration, 1 - forward, 2 - reverse
	steer_dir = 0;          //the angle the wheels should be at
	wheels[0] = noone;      //array to hold the wheels






}
