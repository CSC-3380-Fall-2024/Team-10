/// @description Insert description here
// You can write your code in this editor
event_inherited()

// Draw the text for the button
draw_set_font(fnt_menu)
draw_set_halign(fa_center);
draw_text(x, y - sprite_height / 2 - 53, text); // Label above the button
draw_text(x, y - 23, chr(key_binding)); // Current key binding inside the button

// If editing show your are changing
if (editing) {
    draw_text(x, y + sprite_height / 2 + 10, "Press a key...");
}

