//Draw paint
for (var r = 0; r < array_length(grid); r++)
{
	for (var c = 0; c < array_length(grid[r]); c++)
	{
		if grid[r][c] != -1
		{
			draw_set_color(grid[r][c]);
			draw_rectangle(c*32, r*32, (c*32)+32, (r*32)+32, false);
		}
		else
		{
			draw_set_alpha(0.1);
			draw_set_color(c_gray);
			draw_line(c*32, r*32, (c*32)+33, r*32);
			draw_line((c*32)+33, r*32, (c*32)+33, (r*32)+33);
			draw_line((c*32)+33, (r*32)+33, c*32, (r*32)+33);
			draw_line(c*32, (r*32)+33, c*32, r*32);
			draw_set_alpha(1);
		}
	}
}