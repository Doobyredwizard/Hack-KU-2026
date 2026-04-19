function passive_attack_damage(player, level)
{
	player.melee_damage_mult += global.passives.attack_damage.levels[level-1];
}

function passive_attack_speed(player, level)
{
	player.attack_spd_mult += global.passives.attack_speed.levels[level-1];
}

function passive_in_paint_speed(player, level)
{
	player.in_paint_spd_mult += global.passives.in_paint_speed.levels[level-1];
}

function passive_knockback(player, level)
{
	player.melee_knockback_mult += global.passives.knockback.levels[level-1];
}

function passive_attack_arc(player, level)
{
	player.attack_arc_mult += global.passives.attack_arc.levels[level-1];
}

function passive_attack_length(player, level)
{
	player.attack_length_mult += global.passives.attack_length.levels[level-1];
}

function passive_max_hp(player, level)
{
	player.max_hp += global.passives.max_hp.levels[level-1];
}

function passive_toxic_paint(player, level)
{
	player.paint_damage += global.passives.toxic_paint.levels[level-1];
}