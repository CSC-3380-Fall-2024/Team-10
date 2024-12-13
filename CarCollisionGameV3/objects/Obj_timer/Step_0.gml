/// @description Decrements the game timer and handles the end of the game when time runs out.
/// @param time_left (number) - The time remaining in the game, measured in seconds.
/// @param room_speed (number) - The number of frames per second in the game.
/// @param global.score (number) - The player's current score.

time_left -= 1 / room_speed; // Decrease the timer by one second over the course of a frame

if (time_left <= 0) {
    // Display the final score and end the game
    show_message("Time's up! Final Score: " + string(global.score)); 
    game_restart(); // Restart the game
}