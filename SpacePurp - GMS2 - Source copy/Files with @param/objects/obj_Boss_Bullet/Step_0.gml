/// @description Destroys the instance if it moves beyond a certain point on the x-axis.
/// @param {float} x - The current x-coordinate of the object. If it moves beyond -256, the instance is destroyed.

if(x <= -256) {  // Check if the object has moved past -256 on the x-axis
	instance_destroy();  // Destroy the instance if the condition is met
}
