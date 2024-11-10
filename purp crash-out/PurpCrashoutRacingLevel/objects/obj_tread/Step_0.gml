/// @description Image alpha

//Tyre tracks fade out and disappear over time so as not to slow the game down

image_alpha -= 0.0001
if image_alpha < 0
    {instance_destroy()};

