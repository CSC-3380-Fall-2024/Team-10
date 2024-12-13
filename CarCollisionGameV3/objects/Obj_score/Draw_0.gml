/// @description Displays the player's score on the screen.
/// @param global.score (number) - The player's current score.
/// @param score_text (string) - The text displaying the score.
/// @param x_pos (number) - The x-coordinate for positioning the score text.
/// @param y_pos (number) - The y-coordinate for positioning the score text.

var score_text = "Score: " + string(global.score); // Format the score as a string
var x_pos = room_width - 150; // Position the score near the right edge of the screen
var y_pos = 10; // Position the score near the top of the screen

draw_text(x_pos, y_pos, score_text); // Draw the score on the screen
