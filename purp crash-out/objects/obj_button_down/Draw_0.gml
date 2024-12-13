/**
 * Inherits the parent event and draws the button with its text and key binding.
 * 
 * @param text (string) The display text for the button.
 * @param key_binding (integer) The current key binding for the action, displayed inside the button.
 * @param editing (boolean) A flag indicating whether the button is in editing mode.
 * @param x (integer) The x-coordinate of the button's position.
 * @param y (integer) The y-coordinate of the button's position.
 * @param sprite_height (integer) The height of the button sprite.
 * @param fnt_menu (font) The font used to draw the text.
 */
event_inherited()

// Draw the text for the button
draw_set_font(fnt_menu)
draw_set_halign(fa_center);
draw_text(x, y - sprite_height / 2 - 53, text); // Label above the button
draw_text(x, y - 23, chr(key_binding)); // Current key binding inside the button

// If editing, show "Press a key..." message
if (editing) {
    draw_text(x, y + sprite_height / 2 + 10, "Press a key...");
}

