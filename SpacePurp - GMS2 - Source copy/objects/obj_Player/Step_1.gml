/// @description Sets the position of the thrust particle relative to the ship's position.
/// @param {float} x - The x-coordinate of the ship. The particle will be positioned slightly to the left of the ship.
/// @param {float} y - The y-coordinate of the ship. The particle will be positioned at the same vertical level as the ship.

particle_thrust.set_position(x - (sprite_width / 2), y);  // Position the thrust particle slightly to the left of the ship
