/// @description Event inherited and image speed and image index

//The draw event is inherited from obj_parent_ai

event_inherited();

rallycar_init()

//add wheels
car_add_wheel(-8,-8,true,true,obj_wheel); //top left 
car_add_wheel(8,-8,true,true,obj_wheel);  //top right 
car_add_wheel(-8,10,false,true,obj_wheel); //bottom left 
car_add_wheel(8,10,false,true,obj_wheel);  //bottom right 







