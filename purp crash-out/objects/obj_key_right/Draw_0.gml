draw_self();
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch(key)
{
	case vk_up:
		draw_text(x,y, string("Up"));
	break;
	case vk_down:
		draw_text(x,y, string("Down"));
	break;
	case vk_left:
		draw_text(x,y, string("Left"));
	break;
	case vk_right:
		draw_text(x,y, string("Right"));
	break;
	
	default:
	draw_text(x,y, string(chr(key)));
}