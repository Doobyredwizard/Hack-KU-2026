spawn_time = 1;
spawn_count = 1;

spawn_radius = 320;

wave_reset_time = 5;
wave_time = wave_reset_time;
wave_count = 1;
total_waves = 1;
if (global.wave_type == "hyper") total_waves = infinity;

enemy_pool = [];
pool_weight = 0;

start_wave(wave_count);

function start_wave(wave)
{
	var waves = global.waves[$ global.wave_type];
	if variable_struct_exists(waves, string(wave))
	{
		var data = waves[$ string(wave)];
		wave_reset_time = data.wave_time;
		wave_time = wave_reset_time;
		spawn_time = data.spawn_time;
		spawn_count = data.spawn_count;
		if variable_struct_exists(data, "new_enemies")
		{
			for (var i = 0; i < array_length(data.new_enemies); i++)
			{
				array_push(enemy_pool, data.new_enemies[i]);
			}
		}
		var total_weight = 0;
		for (var i = 0; i < array_length(enemy_pool); i++)
		{
			total_weight += enemy_pool[i].spawn_weight;
		}
		pool_weight = total_weight;
	}
	else
	{
		if variable_struct_exists(waves, "default")
		{
			var data = waves[$ "default"];
			wave_reset_time = data.wave_time;
			wave_time = wave_reset_time;
			spawn_time = data.spawn_time;
			spawn_count = data.spawn_count;
			if variable_struct_exists(data, "new_enemies")
			{
				for (var i = 0; i < array_length(data.new_enemies); i++)
				{
					array_push(enemy_pool, data.new_enemies[i]);
				}
			}
			var total_weight = 0;
			for (var i = 0; i < array_length(enemy_pool); i++)
			{
				total_weight += enemy_pool[i].spawn_weight;
			}
			pool_weight = total_weight;
		}
	}
	
	if wave % 5 == 1 and wave != 1
	{
		instance_create_layer(room_width/2, room_height/2, "Instances", obj_Heal);
	}
}

function spawn_enemy()
{
	var player = obj_Player;
	
	if instance_exists(player)
	{
		var sel_enemy = select_enemy(enemy_pool, pool_weight);
		
		var dir = irandom_range(0, 360);
		
		var spawnx = player.x + lengthdir_x(spawn_radius, dir);
		var spawny = player.y + lengthdir_y(spawn_radius, dir);
		
		var enemy = instance_create_layer(spawnx, spawny, "Instances", obj_Enemy);
		enemy.spd = sel_enemy.spd;
		enemy.max_hp = sel_enemy.hp;
		enemy.hp = enemy.max_hp;
		enemy.damage = sel_enemy.damage;
		enemy.knockback = sel_enemy.knockback;
		enemy.image_xscale = sel_enemy.size;
		enemy.image_yscale = sel_enemy.size;
	}
}

function select_enemy(pool, pool_weight)
{
	var selected_weight = irandom(pool_weight-1);
	
	var weight_count = 0;
	for (var i = 0; i < array_length(pool); i++)
	{
		weight_count += pool[i].spawn_weight;
		
		if (weight_count > selected_weight)
		{
			return pool[i];
		}
	}
	return noone;
}