/// @description 

image_alpha = lerp(image_alpha, 0, 0.06);

if(image_alpha <= 0.1) {
	instance_destroy();
}