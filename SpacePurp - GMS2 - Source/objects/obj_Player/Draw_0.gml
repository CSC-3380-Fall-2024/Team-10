/// @description Draws the player's sprite with a sine wave movement effect, a flash when shooting, and displays the player's hitpoints and score.
/// @param {float} draw_timer - A timer that controls the vertical movement effect for the player's sprite (sinusoidal movement).
/// @param {bool} bullet_show_flash - A boolean that determines if the flash effect is shown when firing a bullet.
/// @param {integer} _hitpoints - The total number of hitpoints for the player.
/// @param {integer} hitpoints - The current number of hitpoints for the player, which decreases as the player takes damage.
/// @param {integer} ui_padding - The padding between hitpoint icons when drawing them on the screen.
/// @param {integer} global.current_score - The player's current score to display on the screen.

draw_sprite(sprite_index, image_index, x, y + sin(draw_timer * 0.1) * 2);  // Draw the player's sprite with a vertical sine wave effect for smooth animation

// Draw bullet flash if the player is shooting
if(bullet_show_flash) {  
	draw_sprite(spr_Flash, 0, x + 8 + bullet_show_flash, y);  // Draw the flash effect near the player's position when shooting
}

// Draw player's hitpoints as icons
var ui_padding = 24;  // Set the padding between hitpoint icons
draw_set(1, c_white);  // Set the drawing color to white
draw_set_align(fa_left);  // Align the text to the left
draw_text(10, 10, "Hitpoints");  // Draw the "Hitpoints" label

// Loop through each hitpoint and draw the corresponding icon
for (var i = 0; i < _hitpoints; i++) {  
    if(i < hitpoints) {  
		draw_sprite_ext(spr_Player, 0, 20 + (i * ui_padding), 40, 0.5, 0.5, 0, c_white, 1);  // Draw a full icon for a remaining hitpoint
	} else {
		draw_sprite_ext(spr_Player, 0, 20 + (i * ui_padding), 40, 0.5, 0.5, 0, c_white, 0.5);
	}
}