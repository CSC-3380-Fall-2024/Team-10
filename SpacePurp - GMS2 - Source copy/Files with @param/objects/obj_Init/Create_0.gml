/// @description Initializes global variables and transitions to the main menu room.
///
/// @global {int} global.current_score - The current score of the game, initialized to 0.
/// @remark The `global.current_score` is used throughout the game to track the player's score.

#region GLOBAL VARIABLES
global.current_score = 0;  // Initialize the global variable to track the current score
#endregion

#region LOAD DATA
// Add any data loading code here if needed, such as loading assets or player progress.
#endregion

room_goto(rm_Menu);  // Transition to the room named rm_Menu (usually the main menu)
