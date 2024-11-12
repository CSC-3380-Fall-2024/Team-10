if night=1
{
draw_set_alpha(0.6)
draw_set_colour(c_black);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0)
draw_set_alpha(1)
}

