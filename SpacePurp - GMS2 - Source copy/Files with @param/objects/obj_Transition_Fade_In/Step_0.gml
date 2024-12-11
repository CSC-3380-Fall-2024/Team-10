/// @description Gradually fades out the instance by decreasing its alpha value and destroys the instance when fully transparent.
/// @param {float} image_alpha - The current alpha transparency of the instance's sprite (ranges from 0 to 1).
/// @param {float} fade_speed - The speed at which the alpha value decreases (default is 0.06).

image_alpha = lerp(image_alpha, 0, 0.06);

if (image_alpha <= 0.1) {
    instance_destroy();
}
