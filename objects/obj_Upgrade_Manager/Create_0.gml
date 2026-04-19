show_choices = false;

upgrade_choices = [];

function get_upgrades()
{
	var player = obj_Player;
	
	if instance_exists(obj_Player)
	{
		var upgrade_possibilites = [];
		//Search through valid passives
		for (var i = 0; i < array_length(global.passives_list); i++)
		{
			var passive = global.passives_list[i];
			var level = player.get_passive_level(passive);
			
			if level < array_length(global.passives[$ passive].levels)
			{
				array_push(upgrade_possibilites, new UpgradeChoice("passive", passive));
			}
		}
		//Search through valid skills
		var skill_count = 0;
		var keys = variable_struct_get_names(player.skills);
		for (var i = 0; i < array_length(keys); i++)
		{
			var key = keys[i];
			if (player.skills[$ key] != noone) skill_count++;
		}
		if skill_count < array_length(keys)
		{
			for (var i = 0; i < array_length(global.skills_list); i++)
			{
				var skill = global.skills_list[i];
			
				if !player.has_skill(global.skills[$ skill])
				{
					array_push(upgrade_possibilites, new UpgradeChoice("skill", skill));
				}
			}
		}
		for (var i = 0; i < 3; i++)
		{
			var index = irandom_range(0, array_length(upgrade_possibilites)-1);
			array_push(upgrade_choices, upgrade_possibilites[index]);
			array_delete(upgrade_possibilites, index, 1);
		}
		show_choices = true;
	}
}

function UpgradeChoice(type, upgrade) constructor
{
	self.type = type;
	self.upgrade = upgrade;
}