var game_mgr = obj_Game_Manager;
if game_mgr.game_state_is_state(GAME_STATE.GAMEPLAY)
{
	hspd = lengthdir_x(spd, dir);
	vspd = lengthdir_y(spd, dir);

	x += hspd;
	y += vspd;

	spd *= drag;
	
	var tick_effects = effects.tick_effects;
	if tick_effects != noone
	{
		for (var i = 0; i < array_length(tick_effects); i++)
		{
			var effect = tick_effects[i];
				
			effect.func(self, effect);
		}
	}

	if lifetime > 0
	{
		lifetime -= delta_time/1000000;
		if lifetime <= 0
		{
			projectile_expire();
		}
	}
}