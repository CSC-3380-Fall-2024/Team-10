/// @description scr_path_get_closest_position(path_index, x, y, precision);
/// @param path_index
/// @param  x
/// @param  y
/// @param  precision
function scr_path_get_closest_position(argument0, argument1, argument2, argument3) {
	//used for determining the path position of a car as it travels around the track

	//IMPORTANT! See obj_car step event 4 and obj_parent ai step event 3 for the use of this script
	//the smaller the number used in the above step events, the slower the game runs, as the more precise it is.  
	//This number has a big effect on the speed or slowness of the game.


	var p_path, px, py, i, xx, yy, xy, solution;

	p_path = argument0;
	px = argument1;
	py = argument2;
	prec = argument3; //from 1 til path length. Smaller numbers are more precise but more CPU instensive

	pri = ds_priority_create();

	for(i=0; i<=1; i+=prec/path_get_length(p_path))
	{
	  xx = path_get_x(p_path, i);
	  yy = path_get_y(p_path, i);
	  ds_priority_add(pri, i, point_distance(xx, yy, px, py));
	}

	solution = ds_priority_find_min(pri);
	ds_priority_destroy(pri);
	return solution;



}
