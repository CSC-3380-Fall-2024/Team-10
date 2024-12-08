/// @description Handles a collision with the boss by invoking the `hit()` function on the boss instance and then destroys the current instance.
/// @param {object} other - The other instance in the room (likely the boss) that this instance interacts with.
/// @param {function} hit - A function called on the `other` instance (the boss) to handle the collision interaction.


// Hit boss and apply damage or effect
with (other) {
    hit(); // Call the hit function on the boss to handle the collision (e.g., reduce health, trigger animation)
}

instance_destroy(); // Destroy the current instance after the interaction (e.g., the projectile or effect)
