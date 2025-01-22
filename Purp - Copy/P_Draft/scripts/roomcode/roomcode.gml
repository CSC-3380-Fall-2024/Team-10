
function roomcode(){
	
	//spawn in player

if (!instance_exists(oPlayer1)) {
	instance_create_layer(global.checkpoint_x, global.checkpoint_y,"Player",oPlayer1);
	
	}
	

if (!instance_exists(oCamera)) {
	instance_create_layer(global.checkpoint_x, global.checkpoint_y,"Player",oCamera);
	
	}
	
	fader();
} 