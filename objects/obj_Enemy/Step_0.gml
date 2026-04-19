var game_mgr = obj_Game_Manager;
if game_mgr.game_state_is_state(GAME_STATE.GAMEPLAY)
{
	event_inherited();

	var player = obj_Player;
	var grid_mgr = obj_Grid_Manager;
	
	image_speed = 1;

	if instance_exists(player)
	{
		var dir = point_direction(x, y, player.x, player.y);
	
		hspd = lengthdir_x(spd, dir);
		vspd = lengthdir_y(spd, dir);
	}

	var force_spds = process_forces();

	hspd += force_spds[0];
	vspd += force_spds[1];

	x += hspd;
	y += vspd;
	
	if in_paint(x, y)
	{
		if instance_exists(player)
		{
			if player.paint_damage > 0
			{
				if paint_tick_time <= 0
				{
					take_damage(new Hit(player.paint_damage, 0, 0, new EntityFaux(x, y, player.team)));
					paint_tick_time = 0.25;
				}
			}
		}
	}
	
	if paint_tick_time > 0
	{
		paint_tick_time -= delta_time/1000000;
	}

	//Thin paint
	var paintx = x div 32;
	var painty = y div 32;

	if grid_mgr.check_tile_color(painty, paintx) != -1
	{
		grid_mgr.paint_tile(painty, paintx, -1);
	}
}
else
{
	image_speed = 0;
}