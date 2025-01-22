/// @description Starting grid positions

if instance_exists (obj_parent_player)
{
x = obj_parent_player.x   
y = obj_parent_player.y
}

global.grid1Ax = x
global.grid1Ay = y-180

global.grid1Bx = x+60
global.grid1By = y-180

global.grid2Ax = x
global.grid2Ay = y-90

global.grid2Bx = x+60
global.grid2By = y-90

global.grid3Ax = x   //player car.x
global.grid3Ay = y   //player car.y

global.grid3Bx = x+60
global.grid3By = y

global.grid4Ax = x
global.grid4Ay =y+90

global.grid4Bx = x+60
global.grid4By = y+90

global.grid5Ax = x
global.grid5Ay = y+180

global.grid5Bx = x+60
global.grid5By = y+180

global.grid6Ax = x          
global.grid6Ay = y+270

global.grid6Bx = x+60
global.grid6By = y+270

global.grid7Ax = x
global.grid7Ay = y+360

global.grid7Bx = x+60
global.grid7By = y+360


//Car slot - 1A
scr_ai_car_starting_grid() //this script defines ai_car (ie. whether it is a sportscar, motorcycle, racing car or so on)
instance_create (global.grid1Ax,global.grid1Ay, ai_car) 

//Car slot - 1B
scr_ai_car_starting_grid()
instance_create (global.grid1Bx,global.grid1By, ai_car)

//Car slot - 2A
scr_ai_car_starting_grid()
instance_create (global.grid2Ax,global.grid2Ay, ai_car)

//Car slot - 2B
scr_ai_car_starting_grid()
instance_create (global.grid2Bx,global.grid2By, ai_car)

//Car slot - 3A //Currently occupied by player car
//scr_ai_car_starting_grid()
//instance_create (global.grid3Ax,global.grid3Ay, ai_car)

//Car slot - 3B
scr_ai_car_starting_grid()
instance_create (global.grid3Bx,global.grid3By, ai_car)

//Car slot - 4A
scr_ai_car_starting_grid()
instance_create (global.grid4Ax,global.grid4Ay, ai_car)

//Car slot - 4B
scr_ai_car_starting_grid()
instance_create (global.grid4Bx,global.grid4By, ai_car)

//Car slot - 5A
//scr_ai_car_starting_grid()
//instance_create (global.grid5Ax,global.grid5Ay, ai_car)

//Car slot - 5B
//scr_ai_car_starting_grid()
//instance_create (global.grid5Bx,global.grid5By, ai_car)




