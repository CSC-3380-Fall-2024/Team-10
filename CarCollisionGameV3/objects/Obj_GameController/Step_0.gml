/// @description Checks the player's health and ends the game if health is zero or below.
/// @param global.player_health (number) - The player's current health value.

if (global.player_health <= 0) {
    show_message("Game Over!"); // Display a Game Over message to the player
    game_restart();            // Restart the game
}