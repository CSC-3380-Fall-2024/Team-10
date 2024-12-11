/// @description Draws the boss sprite, and then renders a health bar above it, showing the current hitpoints as a percentage.
/// @param {float} hitpoints - The current hitpoints of the boss, which determines the health bar's filled percentage.
/// @param {float} _hitpoints - The maximum hitpoints of the boss, used to calculate the percentage of the health bar filled.
/// @param {float} health_bar_alpha - The transparency of the health bar, allowing it to fade in/out or be fully visible.
/// @param {float} width_half - Half of the boss sprite's width, used to position the health bar correctly.
/// @param {float} sprite_height - The height of the boss sprite, used to position the health bar above the sprite.
/// @param {integer} amount - The percentage of the health bar to be filled, calculated based on the current hitpoints and maximum hitpoints.

draw_self(); // Draw the boss sprite as usual

// Calculate the current health percentage
var amount = (hitpoints / _hitpoints) * 100;

// Set the alpha value for the health bar based on the transparency level
draw_set_alpha(health_bar_alpha);

// Draw the health bar above the boss
draw_healthbar(
	x - width_half,  // Left position of the health bar (aligned with the boss's left edge)
	y - sprite_height,  // Top position of the health bar (just above the boss's sprite)
	x + width_half,  // Right position of the health bar (aligned with the boss's right edge)
	y - sprite_height - 4,  // Bottom position of the health bar (slightly offset below the top)
	amount,  // The amount of the health bar filled (as a percentage)
	c_black,  // The border color of the health bar (black)
	c_red,  // The color of the health bar when health is low (red)
	c_green,  // The color of the health bar when health is high (green)
	0,  // No special corner radius (0 for square corners)
	true,  // Fill the health bar from left to right
	true   // Draw the health bar's background (with gradient)
);

// Reset alpha to 1 for normal drawing
draw_set_alpha(1);
