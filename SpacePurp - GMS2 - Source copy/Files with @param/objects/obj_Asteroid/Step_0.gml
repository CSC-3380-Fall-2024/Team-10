/// @description Updates the object's rotation and position based on its speed and rotation values.
/// @param {float} rotation_speed - The speed at which the object rotates (added to the current angle on each step).
/// @param {float} movement_speed - The speed at which the object moves horizontally (decreases the x-coordinate).

image_angle += rotation_speed; // Update the object's rotation by adding the rotation speed to the current angle
x -= movement_speed; // Move the object horizontally to the left by the movement speed (decrease x-coordinate)
