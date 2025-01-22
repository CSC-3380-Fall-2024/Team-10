//stay with player vertically 

if (instance_exists(oPlayer1)) {
	y = oPlayer1.y;
	x_anchor = oPlayer1.x;
 
 }
 
 //horizontal movement 
hsp += spd;
x = x_anchor + (hsp*dir);






