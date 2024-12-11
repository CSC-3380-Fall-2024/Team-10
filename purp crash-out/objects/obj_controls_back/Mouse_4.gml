/// @description Insert description here
// You can write your code in this editor
/**
 * Inherits the parent event and navigates to different rooms based on the current room.
 * 
 * @param room (room) The current room where the game is located.
 * @param rm_sound (room) The room for sound settings.
 * @param rm_controls (room) The room for control settings.
 * @param rm_Options (room) The room for options settings.
 * @param rm_MainMenu (room) The room for the main menu.
 */
event_inherited();

if(room == rm_sound || room == rm_controls) {
    room_goto(rm_Options); // Go to options room if in sound or controls
} else {
    room_goto(rm_MainMenu); // Go to main menu room if not in sound or controls
}


