//If deleting or adding new ai cars, to get the colours to work
//you need to delete obj_main in the room editor, and re-place it in the room
//This is because obj_main creates obj_colour_ai, and obj_colour_ai needs to be
//re-created for the colours to work when adding or deleting ai cars


//Set the draw colour
draw_set_colour(c_white);

//Identify the codes to use for colours at these websites
// https://chrisanselmo.com/gmcolor/ 
//and https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Drawing/Colour_And_Alpha/Colour_And_Alpha.htm


colour_yellow = $00deff//$00fff3//$21f8ee//$23d6fc

colour_green = $15c000

colour_black = $424140

colour_white = $efefef

colour_orange = $0097fa

colour_purple = $ba0a74

colour_light_blue = $ffa600

colour_lime = $00ffa4

colour_pink = $fa00f6

//We are going to assign random colors to the AI cars, then delete it to avoid a memory leak
list_coloredKarts = ds_list_create();

ds_list_add(list_coloredKarts, colour_green); //was c_green
ds_list_add(list_coloredKarts, colour_pink); 
ds_list_add(list_coloredKarts, colour_yellow); //was c_yellow
ds_list_add(list_coloredKarts, c_white);
ds_list_add(list_coloredKarts, colour_purple);
ds_list_add(list_coloredKarts, colour_lime);
ds_list_add(list_coloredKarts, colour_light_blue);
ds_list_add(list_coloredKarts, colour_orange); //was c_orange
ds_list_add(list_coloredKarts, colour_black);
//ds_list_add(list_coloredKarts, colour_blue); //was c_blue
//ds_list_add(list_coloredKarts, c_teal);
//ds_list_add(list_coloredKarts, c_aqua);
//ds_list_add(list_coloredKarts, c_red);  
//ds_list_add(list_coloredKarts, c_maroon);
ds_list_shuffle(list_coloredKarts);
with(obj_parent_ai){
    col_color = other.list_coloredKarts[| 0];
    ds_list_delete(other.list_coloredKarts, 0);
}
ds_list_destroy(list_coloredKarts);


