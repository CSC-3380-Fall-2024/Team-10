x = target.x
y = target.y //follow obj_car

if player.teleport_timer >= 1
{
target = obj_teleport
}

if player.teleport_timer < 1
{
target = player
}

//if instance_exists (obj_teleport)
//{
//target = obj_teleport //camera follows obj_teleport
//}


// Enable this for debugging only

if keyboard_check(ord("V"))
{
target = player
}

//if keyboard_check(ord('B'))
//{
//target = obj_ai_blue
//}

