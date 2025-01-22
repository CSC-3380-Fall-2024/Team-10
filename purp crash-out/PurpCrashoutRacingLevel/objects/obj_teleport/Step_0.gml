if instance_exists (obj_teleport_target)
{
if collision_circle(obj_teleport_target.x, obj_teleport_target.y, 5, id, false, false) //1 is the radius
{
global.collision_timer += 1
}
}

if global.collision_timer = 1  //have this occur at 1 point in time so it doesn't repeat every step.  This is returned to zero in the car step event
{
global.teleport_collided = 1 //also see car step event 
speed = 0
}

if obj_camera.target != obj_teleport
{
destroy_teleport_timer += 1
if destroy_teleport_timer = 10
{
with obj_teleport
{
instance_destroy()
}
}
}



























