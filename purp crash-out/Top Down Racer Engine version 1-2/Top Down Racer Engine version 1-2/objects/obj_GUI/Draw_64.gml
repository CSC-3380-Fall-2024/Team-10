

///Draw the GUI

//Draw the player's current lap

draw_text(ww * 0.75, hh * 0.15, string_hash_to_newline("Lap: " + string(player.trackLap) + " / 2"));
//total number of laps.  Also see the code below in this draw event as to when the race ends

//Also see obj_car step 3 (bottom of code) and obj_parent_ai step 3 as to when the race ends and the cars stop moving


  var a, b, c, d;


    //Draw time
    var seconds, a, minutes, b;
    seconds = int_milliseconds div 60 mod 60;
    if (seconds < 10){//Squeeze that extra zero in, looks better
        a = "0";
    }else{
        a = "";
    }
    minutes = int_milliseconds div 60 div 60 mod 60;
    if (minutes < 10){
        b = "0";
    }else{
        b = "";
    }
    draw_text(ww * 0.75, hh * 0.25, string_hash_to_newline(string(b) + string(minutes) + ":" + string(a) + string(seconds) + ":" + string(int_milliseconds mod 60)));
    
    //Tell the player which place they are in (first, second, third etc)
    ds_priority_clear(car_positions);//Clear the priority
    
    
 //------------------------------------------------------------------------------------   

 
    with  (obj_car)  //see the create event of obj_car which defines the car_type, used in the code below. IMPORTANT
    { //this object is the parent of both the player and ai cars
        var a, b, c, d;
        
 //---------------------------------------------------------------------------------------------------------       
               
        //Our progress around the track is below
        
          ds_priority_add(other.car_positions, id, race_progress) //it was currentPos (to prevent the car showing in the lead if it goes backwards on the first lap) but this causes a minor flicker when crossing the finish line, so it is disabled             
    }
    //-----------------------------------------------------------------------------------------
    
    c = 0; //Variable C is set back to 0
    while(ds_priority_size(car_positions) > 0){//Run thru the priority and find all the players and AI
        c ++;
        with(ds_priority_find_max(car_positions))
        {//Find the leading player
            if (object_index == player_car) //IMPORTANT - see player_car_GUI_script which lists the type of cars.  This list needs to be amended when adding new cars. This variable is defined in the create event of obj_car, and then each of the children below.  
            ///Also see the script 'player_car_GUI' 
            //The ai cars inherits the value through event_inherited in their create events.  
            //The player cars call the script in their create events (because the player cars don't use event inherited.
            //This is done this way because the code won't work simply by referring to the parent, such as obj_parent_player or obj_car.  
            //When done this way, it will say "You came in place", instead of "You came in 5th place"
            {//If the object index is you, remember where you were
                  
                other.int_playerPos = c;
                d = "  You"
            }else{
                d = "";
            }
            draw_text(ww * 0.05, hh * 0.1 + c * 54, string_hash_to_newline(string(c) + string(d))); //54 is the gap between the cars on screen
            //was draw_text(view_xview[0] + 33, view_yview[0] + 0 + c * 35, string(c) + string(d));//Draw the 'You' text //was draw_text(view_xview[0] + 33, view_yview[0] + 0 + c * 35, string(c) + ".)" + string(d));//Draw the 'You' text 
            draw_sprite_ext(sprite_index, 0, ww * 0.13, hh * 0.125 + c * 54, image_xscale, image_yscale, 0, col_color, 1);//Draw the sprite of the car
            // was  draw_sprite_ext(sprite_index, 0, view_xview[0] + 90, view_yview[0] + 15 + c * 35, image_xscale, image_yscale, 0, col_color, 1);//Draw the sprite of the car
            draw_sprite_ext(sprite_index, 1, ww * 0.13, hh * 0.125 + c * 54, image_xscale, image_yscale, 0, c_white, 1);
            // was draw_sprite_ext(sprite_index, 1, view_xview[0] + 90, view_yview[0] + 15 + c * 35, image_xscale, image_yscale, 0, c_white, 1);
        }
        ds_priority_delete_max(car_positions);//Delete from the top of the priority each iteration to look thru it
    }
 


//Wait till the race starts

if (global.race_start)
{
//placings_timer += 1

var a, b, c, d;
    
    //Increase milliseconds every frame
    int_milliseconds ++;
    
//--------------------------------------------------------------------------------------------------------------------------------------------------------    
    
//END OF RACE  
    
if player.race_progress >= 2 //or obj_parent_ai.race_progress >= 2 //2 laps 
{
global.race_start = false
global.race_end = true //see obj_car and obj_ai step events to stop counting laps
}
}
//Also see obj_car step 3 (bottom of code) and obj_parent_ai step 3 as to when the race ends and the cars stop moving

//----------------------------------------------------------------------------------------------------------    
    


//}else{
    //Tell the player what place he came in
    if global.race_end = true//(obj_car.int_currentLap == 1)
    { 
        var a = "";
        switch(int_playerPos){
            case 1: a = "first";break;
            case 2: a = "second";break;
            case 3: a = "third";break;
            case 4: a = "fourth";break;
            case 5: a = "fifth";break;
            case 6: a = "sixth";break;
            case 7: a = "seventh";break;
            case 8: a = "eighth";break;
            case 9: a = "ninth";break;
            case 10: a = "tenth";break;
        }
        draw_text(ww/2, hh * 0.75, string_hash_to_newline("You came in " + string(a) + " place!")); 
        draw_text(ww/2, hh * 0.90, string_hash_to_newline("Press Esc or Backspace")); 
        
        //Can then link variable "a" with results, ie if a = "first", then add points to unlock next level
        
    }
//------------------------------------------------------------------------------------




