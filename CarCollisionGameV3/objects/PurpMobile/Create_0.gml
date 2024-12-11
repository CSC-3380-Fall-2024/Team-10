/// @description Initializes the player's car variables, including movement properties, starting direction, and global stats.
/// @param direction (number) - The initial direction the car is facing, measured in degrees.
/// @param speed (number) - The initial speed of the car.
/// @param acceleration (number) - The rate at which the car accelerates.
/// @param max_speed (number) - The maximum speed the car can achieve.
/// @param friction (number) - The rate at which the car slows down when not accelerating.
/// @param turn_speed (number) - The rate at which the car turns, measured in degrees per step.
/// @param image_angle (number) - The initial rotation of the car's sprite.
/// @param global.score (number) - The player's starting score.
/// @param global.player_health (number) - The player's starting health.

direction = 270;        // Start facing upward
speed = 0;              // Initial speed
acceleration = 0.2;     // Acceleration rate
max_speed = 5;          // Maximum speed
friction = 0.1;         // Friction to slow down the car
turn_speed = 3;         // How fast the car turns
image_angle = direction; // Set the initial sprite angle to match the direction
global.score = 0;       // Set the player's starting score to 0
global.player_health = 100; // Set the player's starting health to 100



