var game_mgr = obj_Game_Manager;
if game_mgr.game_state_is_state(GAME_STATE.GAMEPLAY)
{
	
	var pulse_effects = effects.pulse_effects;
	if pulse_effects != noone
	{
		for (var i = 0; i < array_length(pulse_effects); i++)
		{
			var effect = pulse_effects[i];
				
			if effect.pulse_time <= 0
			{
				effect.func(self, effect);
				effect.pulse_time = effect.pulse_reset_time;
			}
			else
			{
				effect.pulse_time -= delta_time/1000000;
			}
		}
	}
	
	if lifetime > 0
	{
		lifetime -= delta_time/1000000;
		if lifetime <= 0
		{
			instance_destroy();
		}
	}
}