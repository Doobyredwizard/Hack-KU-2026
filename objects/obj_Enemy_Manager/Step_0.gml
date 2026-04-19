var game_mgr = obj_Game_Manager;
var upgrade_mgr = obj_Upgrade_Manager;
var player = obj_Player;
if game_mgr.game_state_is_state(GAME_STATE.GAMEPLAY)
{
	spawn_time -= delta_time/1000000;
	if spawn_time <= 0
	{
		repeat (spawn_count) spawn_enemy();
		spawn_time = 1;
	}
	
	if wave_time > 0
	{
		wave_time -= delta_time/1000000;
		if wave_time <= 0
		{
			if instance_exists(player)
			{
				if wave_count < total_waves
				{
					if array_length(player.palette) < 21
					{
						game_mgr.push_game_state(GAME_STATE.UPGRADE);
						upgrade_mgr.get_upgrades();
					}
					wave_count++;
					start_wave(wave_count);
				}
				else
				{
					game_mgr.push_game_state(GAME_STATE.END);
					var end_mgr = instance_create_layer(0, 0, "UI", obj_Game_End_Manager);
					end_mgr.game_end_state = 1;
				}
			}
		}
	}
}