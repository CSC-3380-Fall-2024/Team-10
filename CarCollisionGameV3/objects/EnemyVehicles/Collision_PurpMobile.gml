/// @description Checks if the player's car exists and reduces the player's health on collision.
/// @param other (object) - The object representing the player's car.
/// @param global.player_health (number) - The global variable tracking the player's health.

if (instance_exists(other)) {
    global.player_health -= 10; // Subtract 10 health points (adjust as needed)

    // Destroy the enemy vehicle
    instance_destroy();
}

