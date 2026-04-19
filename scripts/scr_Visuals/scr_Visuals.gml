function visual_default(source)
{
	draw_self();
}

function visual_paint_bomb(source)
{
	var player = obj_Player;
	var color;
	if instance_exists(player)
	{
		color = player.color;
	}
	else
	{
		color = c_white;
	}
	draw_sprite_ext(spr_Paint_Bomb, 0, source.x, source.y, 1, 1, 0, color, 1);
}

function visual_drone(source)
{
	draw_sprite(spr_Drone, 0, source.x, source.y);
}

function visual_pulser(source)
{
	draw_sprite(spr_Drone, 0, source.x, source.y);
}