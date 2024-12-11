/**
 * Draws the button with the specified text using custom alignment and font settings.
 * 
 * @param fnt_menu (font) The font used to draw the button text.
 * @param x (integer) The x-coordinate of the button's position.
 * @param y (integer) The y-coordinate of the button's position.
 * @param button_text (string) The text to be displayed on the button.
 */
draw_self();

draw_set_font(fnt_menu);

draw_set_halign(fa_center); // Set horizontal alignment to center
draw_set_valign(fa_middle); // Set vertical alignment to middle

draw_text(x, y, button_text); // Draw the button text

draw_set_halign(fa_left); // Reset horizontal alignment to left
draw_set_valign(fa_top); // Reset vertical alignment to top
