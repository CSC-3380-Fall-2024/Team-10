//See step 4 event of obj_parent_ai for following the target object at speed

path_start (choose (asset_get_index(room_get_name(room)+"A") , asset_get_index(room_get_name(room)+"B") , asset_get_index(room_get_name(room)+"C") ), 7, path_action_continue, true); //7 is the starting speed of the object on the path 



