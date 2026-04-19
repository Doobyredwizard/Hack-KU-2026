event_inherited();

max_hp = 0;
hp = 0;

hspd = 0;
vspd = 0;

forces = [];

iframe_set = 30;
iframes = 0;
can_use_iframes = false;

flash = 0;
flash_drain_spd = 0.05;

function in_paint(xx, yy)
{
	var grid_mgr = obj_Grid_Manager;
	var paintx = xx div 32;
	var painty = yy div 32;
	
	if grid_mgr.check_tile_color(painty, paintx) != -1
	{
		return true;
	}
	return false;
}

function process_forces()
{
	var forcex = 0;
	var forcey = 0;
	for (var i = 0; i < array_length(forces); i++)
	{
		var force = forces[i];
	
		forcex += lengthdir_x(force.strength, force.dir);
		forcey += lengthdir_y(force.strength, force.dir);
	
		force.strength *= force.decay;
	
		if force.strength < 0.1
		{
			array_delete(forces, i, 1);
		}
	}
	return [forcex, forcey];
}

function hit_receive(source)
{
	var knockback_dir = point_direction(source.x, source.y, x, y);
	take_damage(new Hit(source.damage, source.knockback, knockback_dir, source));
}

function take_damage(hit)
{
	if iframes <= 0
	{
		hp -= hit.damage;
		flash = 1;
		array_push(forces, new Force(hit.knockback, hit.knockback_dir, 0.8));
		if hp <= 0
		{
			die();
		}
		if can_use_iframes
		{
			iframes = iframe_set;
		}
	}
}

function process_hit_list()
{
	var keys = ds_map_keys_to_array(hit_list);
	
	for (var i = 0; i < array_length(keys); i++)
	{
		var key = keys[i];
		
		hit_list[? key]--;
		
		if hit_list[? key] <= 0
		{
			ds_map_delete(hit_list, key);
		}
	}
}

function die()
{
	var grid_mgr = obj_Grid_Manager;
	var player = obj_Player;
	
	var radius = 3;
	var paintx = x div 32;
	var painty = y div 32;

	if instance_exists(player)
	{
		for (var r = painty-radius; r < painty+radius; r++)
		{
			for (var c = paintx-radius; c < paintx+radius; c++)
			{
				var tile_centerx = (c*32)+16;
				var tile_centery = (r*32)+16;
				if point_distance(x, y, tile_centerx, tile_centery) <= radius*32
				{
					if grid_mgr.check_tile_color(r, c) != player.color
					{
						grid_mgr.paint_tile(r, c, player.color);
					}
				}
			}
		}
	}
	
	
	if object_index == obj_Enemy
	{
		if instance_exists(player)
		{
			player.trigger_event("on_enemy_death", 
				{
					entity_faux: new EntityFaux(x, y, player.team)
				}
			)
		}
		
		for (var i = 0; i < 360; i += 12)
		{
			var xx = x + lengthdir_x(16, i);
			var yy = y + lengthdir_y(16, i);
			part_particles_create(global.particle_systems[$ "part_system_back"], xx, yy, global.particles[$ "colorless_vacuum"], 1);
		}
	}
	
	if object_index == obj_Player
	{
		var game_mgr = obj_Game_Manager;
		game_mgr.push_game_state(GAME_STATE.END);
		instance_create_layer(0, 0, "UI", obj_Game_End_Manager);
	}
	
	instance_destroy();
}