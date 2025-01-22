/// @description car_ai_get_target()
///This script is called from the car_ai_update script
function car_ai_get_target() {
	//creates the target object that an ai car will follow around the track


	ai_target = instance_create (x,y, obj_target); 

	with (ai_target)
	{
	  id_of_origin = other.id; //this identifies the ai_car that created the target
	}
	//id_of_origin is used in obj_target Draw 1 event to colour the target 
	//the same colour as the ai car's colour



}
