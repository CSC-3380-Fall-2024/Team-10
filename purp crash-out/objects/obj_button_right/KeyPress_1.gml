/**
 * Updates the key binding when in editing mode and exits editing mode.
 * 
 * @param editing (boolean) A flag indicating whether the button is in editing mode.
 * @param key_binding (integer) The current key binding for the action, updated when a key is pressed.
 * @param keyboard_lastkey (integer) The key that was last pressed on the keyboard, used to update the key binding.
 * @param text (string) The display text for the button, used to check which button is being edited.
 * @param global.key_right (integer) A global variable that stores the key binding for the "Right" action.
 */
if (editing) {
    key_binding = keyboard_lastkey; // Update the binding
    if(text == "Right"){
        global.key_right = key_binding;
    }
    editing = false; // Exit editing mode
}
