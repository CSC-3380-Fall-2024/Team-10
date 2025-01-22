if global.cs_menu !=1
{
image_index = 0 //white - not selected
select_on = 0
select_timer = 0
icon_on = 0
icon_timer  = 0
}

if global.cs_menu = 1   
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

//was TweenSimpleScale(0.8,0.8,2,2,30,EaseInOutQuad) //scale up the menu selection

if select_timer > 240 
{
select_on = 0
select_timer = 0
}

//-----Create the icon only once (not once every step).  It is created once when the icon_timer reaches 1

if icon_on = 1
{
icon_timer+=1
}

//if icon_on = 1 and icon_timer = 1
//{
//instance_create (x,y, obj_racetrack_pic)
//instance_create (x,y, obj_circuit_sprint_logo)
//}

//--------------------------------

