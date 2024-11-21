/// @description Settings

GUIfullscreen()   //script for maximising GUI - see Gamemaker tech blog  https://www.yoyogames.com/tech_blog/79

//This is used to count up the time
int_milliseconds = 0;

//The positions of the cars (who's in first place? second place? etc)
car_positions = ds_priority_create();

//This is the position of the player. We display this at the end of the race
int_playerPos = 0;

//We don't show the placings until after the race has started
placings_timer = 0

show_placings = 0

///trackPos and trackLap

trackPos = 0;
trackLap = 0;



///Player variable

player = obj_parent_player //this is the parent object of obj_sportscar, obj_convertible, etc, used in the Draw event 


