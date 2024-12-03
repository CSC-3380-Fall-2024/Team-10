/// @description Initializes object properties and defines a `hit()` function to handle damage, particle effects, and scoring.
/// @param {float} image_angle - The rotation angle of the object (randomized between 0 and 360 degrees).
/// @param {float} image_xscale - The horizontal scale factor of the object (randomized between 0.5 and 1).
/// @param {float} image_yscale - The vertical scale factor, synchronized with `image_xscale`.
/// @param {float} rotation_speed - The speed at which the object rotates (randomized between -1 and 1).
/// @param {float} movement_speed - The movement speed of the object (set to 3).
/// @param {integer} hitpoints - The initial number of hitpoints (set to 2).
/// @param {function} hit - The function that handles the damage taken, including playing a sound, triggering particle effects, and updating the score.

randomize(); // Randomize the random number generator for true randomness

// Initialize random object properties
image_angle = random(360); // Set a random rotation angle between 0 and 360 degrees
image_xscale = random_range(0.5, 1); // Randomize the horizontal scale factor between 0.5 and 1
image_yscale = image_xscale; // Set the vertical scale equal to the horizontal scale for uniform scaling

rotation_speed = random_range(-1, 1); // Randomize rotation speed between -1 and 1 (counterclockwise or clockwise)
movement_speed = 3; // Set the movement speed to 3 (constant)

hitpoints = 2; // Set the initial number of hitpoints for the object

// Define the hit function to handle damage and effects
hit = function() {
    hitpoints -= 1; // Decrease hitpoints when the object is hit
    
    // If a particle effect instance is found, set its position and trigger a burst effect
    var instance_particle = instance_find(obj_Particle_Hit, 0);
    if (instance_particle != noone) {
        instance_particle.particle.set_position(x, y); // Set the position of the particle effect to the object's location
        instance_particle.particle.burst(1); // Trigger a particle burst (1 particle)
    }
    
    play_sound(snd_Hit); // Play the hit sound effect
    
    // If hitpoints are reduced to 0 or less, increase the score and destroy the object
    if (hitpoints <= 0) {
        global.current_score += 10; // Add 10 points to the global score
        instance_destroy(); // Destroy the object
    }
}
