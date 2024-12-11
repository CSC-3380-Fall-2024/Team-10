/// @description Insert description here
// You can write your code in this editor
/**
 * Event handler for the button, drawing the button label and key binding.
 * 
 * @param text (string) The display text for the button.
 * @param key_binding (integer) The global key binding for the action.
 * @param editing (boolean) A flag indicating whether the button is in editing mode.
 */
event_inherited()

// Draw the text for the button
draw_set_font(fnt_menu)
draw_set_halign(fa_center);
draw_text(x, y - sprite_height / 2 - 53, text); // Label above the button
draw_text(x, y - 23, chr(key_binding)); // Current key binding inside the button

// If editing show message
if (editing) {
    draw_text(x, y + sprite_height / 2 + 10, "Press a key...");
}

