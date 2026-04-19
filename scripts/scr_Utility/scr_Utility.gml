function draw_text_outlined(xx, yy, text, color, outline_color, outline_width)
{
	draw_set_color(outline_color);
	for (var i = 1; i <= outline_width; i++)
	{
		draw_text(xx-i, yy, text);
		draw_text(xx-i, yy-i, text);
		draw_text(xx, yy-i, text);
		draw_text(xx+i, yy-i, text);
		draw_text(xx+i, yy, text);
		draw_text(xx+i, yy+i, text);
		draw_text(xx, yy+i, text);
		draw_text(xx-i, yy+i, text);
	}
	draw_set_color(color);
	draw_text(xx, yy, text);
}