/// @description Shows an explosion effect by invoking the `hit()` function on all `other` instances and then destroys the current instance.
/// @param {object} other - The other instances in the room that the explosion interacts with (likely enemies or objects).
/// @param {function} hit - A function that is called on `other` instances to handle the explosion interaction.


// Show explosion effect
with (other) {
    hit(); // Call the hit function on the other instance to handle the explosion interaction
}

instance_destroy(); // Destroy the current instance (the explosion source)
