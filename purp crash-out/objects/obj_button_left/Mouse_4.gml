/// @description Insert description here
// You can write your code in this editor
event_inherited()
if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
    editing = true; // Enter editing mode
}
