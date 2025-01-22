//momentum system
hsp = 0;
vsp = 0;
accel = 0.5;
decel = 0.2;

//speed
max_hsp = 5.5; //horizontal speed limit
grav = 0.3; // "gravity"
grav_max = 12; // max fall speed
grav_wall = 0.1; // wall slide gravity
grav_max_wall = 5; // max wall slide speed

//jumping
groundbuffer =12; //accounts for coyote time
jumpheight = -9; // jump height
jumpbuffer =10; 
jumpheight_min = -4; // minimum jump height when key is tapped
walljumpdistance = 5; //max hsp when jumping away from wall
jumpheight_wall = -9; //jump height when jumping up off wall
walljumpdelay = 0;
walljumpdelay_max = 15;


//attack 
attack_cooldown = 0;
attack_timer = 10; //number of frames before player can attack again