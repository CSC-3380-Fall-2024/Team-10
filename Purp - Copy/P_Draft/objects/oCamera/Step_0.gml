//Update Destination
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;

}

//Update obj position

x += (xTo - x) / cam_followspeed;
y += (yTo - y) / cam_followspeed;

x = clamp(x,width_half+buff,room_width-width_half-buff);
y = clamp(y,height_half+buff,room_height-height_half-buff);


//Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

//Make magnitude get less intense over time
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));





//Update camera view
camera_set_view_pos(cam,x-width_half,y-height_half);