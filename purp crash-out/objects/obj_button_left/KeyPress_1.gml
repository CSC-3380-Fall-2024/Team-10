/// @description Insert description here
// You can write your code in this editor
/**
 * Updates the key binding when in editing mode and exits editing mode.
 * 
 * @param editing (boolean) A flag indicating whether the button is in editing mode.
 * @param key_binding (integer) The current key binding for the action.
 * @param keyboard_lastkey (integer) The key that was last pressed on the keyboard.
 * @param text (string) The display text for the button, used to check which button is being edited.
 * @param global.key_left (integer) A global variable that stores the key binding for the "Left" action.
 */
if (editing) {
    key_binding = keyboard_lastkey; // Update the binding
    if(text == "Left"){
        global.key_left = key_binding;
    }
    editing = false; // Exit editing mode
}
