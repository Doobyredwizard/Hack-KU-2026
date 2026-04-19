if point_in_rectangle(mouse_x, mouse_y, 160, 112, 288, 144)
{
	if mouse_check_button(mb_left)
	{
		global.wave_type = "normal";
		room_goto(rm_Paint);
	}
}

if point_in_rectangle(mouse_x, mouse_y, 352, 112, 480, 144)
{
	if mouse_check_button(mb_left)
	{
		global.wave_type = "hyper";
		room_goto(rm_Paint);
	}
}