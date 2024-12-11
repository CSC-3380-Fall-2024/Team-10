/**
 * Inherits the parent event and checks if the mouse is over the button to enter editing mode.
 * 
 * @param mouse_x (integer) The x-coordinate of the mouse pointer.
 * @param mouse_y (integer) The y-coordinate of the mouse pointer.
 * @param x (integer) The x-coordinate of the button's position.
 * @param y (integer) The y-coordinate of the button's position.
 * @param sprite_width (integer) The width of the button sprite.
 * @param sprite_height (integer) The height of the button sprite.
 * @param editing (boolean) A flag indicating whether the button is in editing mode.
 */
event_inherited()

if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
    editing = true; // Enter editing mode
}

