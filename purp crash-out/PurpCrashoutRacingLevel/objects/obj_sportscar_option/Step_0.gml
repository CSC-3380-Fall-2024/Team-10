if global.cs_menu !=1
{
image_index = 0 //white - not selected
select_on = 0
select_timer = 0
icon_on = 0
icon_timer  = 0
//tween2 = TweenSimpleScale(0.6,0.6,1,1,1,EaseInOutQuad) //go back to normal size
//if instance_exists (obj_racetrack_pic)
//{
//instance_destroy (obj_racetrack_pic)
//}
//if instance_exists (obj_circuit_sprint_logo)
//{
//instance_destroy (obj_circuit_sprint_logo)
//}
}

if global.cs_menu = 7 
{
image_index = 1  //red - selected
select_on = 1
icon_on = 1
}

//-----Create the tween only once (not once every step).  It is created once when the select_timer reaches 1


if select_on = 1
{
select_timer+=1
}

//if select_on = 1 and select_timer = 1  
//{
//tween1 = TweenSimpleScale(0.6,0.6,1,1,30,EaseInOutQuad) //scale up the menu selection
//}

//-----Create the icon only once (not once every step).  It is created once when the icon_timer reaches 1

if icon_on = 1
{
icon_timer+=1
}

//if icon_on = 1 and icon_timer = 1
//{
//instance_create (x,y, obj_city_pic) //creates the icon for the selection
//instance_create (x,y, obj_new_jack_city_logo)
//}

//--------------------------------



if select_timer > 240 
{
select_on = 0
select_timer = 0
}


if global.cs_menu !=7 
{
image_index = 0 //white - not selected
select_on = 0
select_timer = 0
icon_on = 0
icon_timer  = 0
//tween2 = TweenSimpleScale(0.6,0.6,1,1,1,EaseInOutQuad) //go back to normal size
//if instance_exists (obj_city_pic)
//{
//instance_destroy (obj_city_pic)
//}
//if instance_exists (obj_new_jack_city_logo)
//{
//instance_destroy (obj_new_jack_city_logo)
//}
}



