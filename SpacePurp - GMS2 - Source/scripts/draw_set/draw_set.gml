/// @description Sets the alpha (transparency) and color for drawing.
/// @param {float} _alpha - The transparency of the drawn elements, where 1 is fully opaque and 0 is fully transparent. Default is 1.
/// @param {color} _color - The color of the drawn elements. Default is white (c_white).

function draw_set(_alpha = 1, _color = c_white) {
    draw_set_alpha(_alpha);  // Set the transparency of the drawn elements
    draw_set_color(_color);  // Set the color of the drawn elements
}

/// @description Sets the horizontal and vertical alignment for drawing text.
/// @param {enum} _horizontal - The horizontal alignment for the text. Default is `fa_left` (left alignment).
/// @param {enum} _vertical - The vertical alignment for the text. Default is `fa_middle` (middle alignment).

function draw_set_align(_horizontal = fa_left, _vertical = fa_middle) {
    draw_set_halign(_horizontal);  // Set the horizontal alignment for drawing text
    draw_set_valign(_vertical);    // Set the vertical alignment for drawing text
}
