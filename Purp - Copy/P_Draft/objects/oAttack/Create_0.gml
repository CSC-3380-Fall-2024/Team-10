spd = 2;
hsp = 0

if (instance_exists(oPlayer1)){
	image_xscale = oPlayer1.image_xscale; //go left or right depending on player
	x_anchor = oPlayer1.x;

}

if (image_xscale == 1){
	dir = 1; 
} else {
	dir =-1;
}