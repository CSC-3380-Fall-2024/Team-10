//https://forum.yoyogames.com/index.php?threads/screen-shake-with-views.6411/

player = obj_parent_player  //this is the parent object of obj_sportscar, obj_convertible, etc, and the camera will lock onto it.

/// Camera Target
target = player //Camera target, (What camera will be following)


/// Screen Shake Amount
min_amount_ = 1; // Min Screen Shake
max_amount_ = 5; // Max Screen Shake

/// Screen Shake On or Off
screen_shake_ = false; // Screen Shake On or Off?

//timer for screen_shake
shake_timer = 0

