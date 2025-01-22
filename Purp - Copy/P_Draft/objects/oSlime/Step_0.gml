//calculate horizontal movement
hsp = current_dir * hsp_max;

//calculate vertical movement 
vsp += grav;
vsp = clamp(vsp, -vsp_max, vsp_max);
sprite_index = sSLimeMove;


//horizontal collision
if (place_meeting(x+hsp,y,oBlock)) {
	var _pixel = sign(hsp);
	while (!place_meeting(x+_pixel,y,oBlock)) x += _pixel;
	hsp =0;
	current_dir *= -1; //change directions
	image_xscale *= -1;
}


//vertical collision
if (place_meeting(x,y+vsp,oBlock)){
	var _pixel = sign(vsp);
	while (!place_meeting(x,y+_pixel,oBlock)) y += _pixel;
	vsp = 0;
}

//Commit to movement 
x += hsp;
y += vsp;

//react to attack
if (place_meeting(x,y,oAttack)){
instance_destroy();	
}