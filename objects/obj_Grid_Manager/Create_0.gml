grid = [];

for (var r = 0; r < room_height; r += 32)
{
	var row = [];
	for (var c = 0; c < room_width; c += 32)
	{
		array_push(row, -1);
	}
	array_push(grid, row);
}

function paint_tile(row, col, color)
{
	if row >= 0 and col >= 0 and row < array_length(grid) and col < array_length(grid[0])
	{
		grid[row][col] = color;
	}
}

function check_tile_color(row, col)
{
	if row >= 0 and col >= 0 and row < array_length(grid) and col < array_length(grid[0])
	{
		return grid[row][col];
	}
	return -1;
}