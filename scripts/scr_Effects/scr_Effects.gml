function effect_start_dash(player, effect)
{
	var dash = {
		time: effect.params.duration,
		spd: effect.params.spd,
		dir: point_direction(player.x, player.y, mouse_x, mouse_y),
		effects: setup_effects(effect)
	};
	
	player.dash = dash;
}

function effect_aoe_damage(source, effect)
{
	var radius = effect.params.radius;
	var damage = effect.params.damage;
	var knockback = effect.params.knockback;
	var hit_cooldown_frames = 30;
	var team = source.team;
	
	var list = ds_list_create();
	collision_circle_list(source.x, source.y, radius, obj_Entity, false, false, list, true);
	
	for (var i = 0; i < ds_list_size(list); i++)
	{
		var hit = list[|i];
		if hit.team != team
		{
			if !ds_map_exists(effect.hit_list, hit.id)
			{
				effect.hit_list[? hit.id] = hit_cooldown_frames;
				var knockback_dir = point_direction(source.x, source.y, hit.x, hit.y);
				hit.take_damage(new Hit(damage, knockback, knockback_dir, self));
			}
		}
	}
	
	ds_list_destroy(list);
}

function effect_aoe_paint(source, effect)
{
	var grid_mgr = obj_Grid_Manager;
	var player = obj_Player;
	
	var radius = effect.params.radius;
	var paintx = source.x div 32;
	var painty = source.y div 32;

	if instance_exists(player)
	{
		for (var r = painty-radius; r < painty+radius; r++)
		{
			for (var c = paintx-radius; c < paintx+radius; c++)
			{
				var tile_centerx = (c*32)+16;
				var tile_centery = (r*32)+16;
				if point_distance(source.x, source.y, tile_centerx, tile_centery) <= radius*32
				{
					if grid_mgr.check_tile_color(r, c) != player.color
					{
						grid_mgr.paint_tile(r, c, player.color);
					}
				}
			}
		}
	}
}

function effect_projectile_create(entity, effect)
{
	var damage = effect.params.damage;
	var spd = effect.params.spd;
	var drag = effect.params.drag;
	var lifetime = effect.params.lifetime;
	var can_contact_damage = effect.params.can_contact_damage;
	var projectile = instance_create_layer(entity.x, entity.y, "Instances", obj_Projectile);
	projectile.team = entity.team;
	projectile.damage = damage;
	projectile.spd = spd;
	projectile.dir = point_direction(entity.x, entity.y, mouse_x, mouse_y);
	projectile.drag = drag;
	projectile.lifetime = lifetime;
	projectile.can_contact_damage = can_contact_damage;
	projectile.effects = setup_effects(effect);
	if variable_struct_exists(effect, "visual")
	{
		projectile.visual = effect.visual;
	}
}

function effect_construct_create(entity, effect)
{
	var lifetime = effect.params.lifetime;
	var construct = instance_create_layer(entity.x, entity.y, "Instances", obj_Construct);
	construct.lifetime = lifetime;
	construct.team = entity.team;
	construct.effects = setup_effects(effect);
	
	for (var i = 0; i < array_length(construct.effects); i++)
	{
		var ef = construct.effects[i];
		ef.pulse_time = ef.pulse_reset_time;
	}
}

function effect_chance(entity, effect)
{
	var chance = effect.params.chance;
	if chance >= random(1)
	{
		var chance_effects = effect.chance_effects;
		if chance_effects != noone
		{
			for (var i = 0; i < array_length(chance_effects); i++)
			{
				var ef = chance_effects[i];
				
				ef.func(entity, ef);
			}
		}
	}
}