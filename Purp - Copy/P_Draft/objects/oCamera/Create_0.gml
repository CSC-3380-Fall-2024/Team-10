cam = view_camera[0]; //gives camera a name
cam_followspeed = 16; 
follow = oPlayer1; //defines the object to folloq
width_half = camera_get_view_width(cam)*0.5;
height_half = camera_get_view_height(cam)*0.5;

xTo = x;
yTo = y; 



//Screen Shake
shake_length = 0; //time length in frames
shake_magnitude = 0; //how big is the shake
shake_remain = 0; //countdowntimer for screen shake
buff = 32; //distance in pixels from edge of room