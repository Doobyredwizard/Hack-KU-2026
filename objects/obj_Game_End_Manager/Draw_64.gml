if game_end_state == 1
{
	draw_set_font(fnt_Candara_12);

	draw_text_outlined(320, 180, "You have won. For now.", c_white, c_black, 1);
	draw_text_outlined(320, 196, "Press ESC.", c_white, c_black, 1);
}
else
{
	draw_set_font(fnt_Candara_12);

	draw_text_outlined(320, 180, "You have perished. Go again.", c_white, c_black, 1);
	draw_text_outlined(320, 196, "Press ESC.", c_white, c_black, 1);
}