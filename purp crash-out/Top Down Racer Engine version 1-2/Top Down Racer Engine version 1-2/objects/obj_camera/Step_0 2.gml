x = target.x
y = target.y //follow obj_car


/// If Screen Shake is True, DO SCREEN SHAKE
if (screen_shake_ == true)  
{
shake_timer+=1
x = target.x+random_range(min_amount_, max_amount_)
y = target.y+random_range(min_amount_, max_amount_)
if shake_timer = 20 //was 125
{
screen_shake_ = false
shake_timer = 0
}
}

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

