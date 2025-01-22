/// @description /

//inst = instance_nearest(obj_car.x, obj_car.y, obj_path);
 
//draw_line(obj_car.x, obj_car.y, inst.x, inst.y);

/*
    
    with(o_b2d_car) //draw car velocity line.
    {
        var a = point_direction(0,0,phy_speed_x,phy_speed_y);
        var xx = lengthdir_x(phy_speed * 10,a);
            yy = lengthdir_y(phy_speed * 10,a);
            
        if(phy_speed >= max_speed*0.9)
            draw_set_colour(c_red);
            
        draw_line(x,y,x+xx,y+yy);
    }

/* */
/*  */
