var base_w = 640;
var base_h = 360;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = display_get_width() / display_get_height();
if (max_w < max_h)
    {
    // portait
    var VIEW_WIDTH = min(base_w, max_w);
    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
    }
else
    {
    // landscape
    var VIEW_HEIGHT = min(base_h, max_h);
    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
    }

__view_set( e__VW.WView, 0, floor(VIEW_WIDTH) );
__view_set( e__VW.HView, 0, floor(VIEW_HEIGHT) );
__view_set( e__VW.WPort, 0, max_w );
__view_set( e__VW.HPort, 0, max_h );

surface_resize(application_surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));

__view_set( e__VW.WView, 1, floor(VIEW_WIDTH) );
__view_set( e__VW.HView, 1, floor(VIEW_HEIGHT) );
__view_set( e__VW.WPort, 1, max_w );
__view_set( e__VW.HPort, 1, max_h );

surface_resize(application_surface, __view_get( e__VW.WView, 1 ), __view_get( e__VW.HView, 1 ));