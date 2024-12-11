/// @description Insert description here
// You can write your code in this editor
if (editing) {
    key_binding = keyboard_lastkey; // Update the binding
	if(text =="Up"){
		global.key_up = key_binding;
	}
    editing = false; // Exit editing mode
}