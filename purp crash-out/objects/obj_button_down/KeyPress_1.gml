/// @description Insert description here
// You can write your code in this editor
if (editing) {
    key_binding = keyboard_lastkey; // Update the binding
	if(text =="Down"){
		global.key_down = key_binding;
	}
    editing = false; // Exit editing mode
}