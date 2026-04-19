var game_mgr = obj_Game_Manager;
if game_mgr.game_state_is_state(GAME_STATE.GAMEPLAY)
{
	var grid_mgr = obj_Grid_Manager;

	if brush_time < brush_dur
	{
		image_angle = lerp(angle_start, angle_start+(arc_angle*brush_dir), brush_time/brush_dur);
		part_type_color1(pt_brush, color);
		part_type_direction(pt_brush, image_angle+180-3, image_angle+180+3, 0, 0);
		var xx = x + lengthdir_x(36*image_yscale, image_angle+90);
		var yy = y + lengthdir_y(36*image_yscale, image_angle+90);
		part_particles_create(global.particle_systems[$ "part_system_back"], xx, yy, pt_brush, 2);
		brush_time += delta_time/1000000;
	}
	else
	{
		instance_destroy();
	}

	//Check tiles to paint
	var radius = 5;
	var paintx = x div 32;
	var painty = y div 32;

	for (var r = painty-radius; r < painty+radius; r++)
	{
		for (var c = paintx-radius; c < paintx+radius; c++)
		{
			if collision_rectangle(c*32, r*32, (c*32)+32, (r*32)+32, self, false, false)
			{
				var tile_centerx = (c*32)+16;
				var tile_centery = (r*32)+16;
				if point_distance(x, y, tile_centerx, tile_centery) <= radius*32
				{
					if grid_mgr.check_tile_color(r, c) != color
					{
						grid_mgr.paint_tile(r, c, color);
					}
				}
			}
		}
	}
}