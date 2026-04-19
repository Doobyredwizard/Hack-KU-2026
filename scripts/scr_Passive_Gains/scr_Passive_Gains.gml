function passive_max_hp_gain(player, level)
{
	var prev_level;
	if level > 1
	{
		prev_level = global.passives.max_hp.levels[level-2];
	}
	else
	{
		prev_level = 0;
	}
	player.hp += global.passives.max_hp.levels[level-1]-prev_level;
}