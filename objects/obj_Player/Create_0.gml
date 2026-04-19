event_inherited();

spd = 2;

in_paint_spd_mult = 1;

color = #E6E6E6;

max_hp = 100;
hp = max_hp;

team = 0;

can_use_iframes = true;

melee_damage = 10;
melee_damage_mult = 1;
attack_spd = 2;
attack_spd_mult = 1;
melee_knockback = 12;
melee_knockback_mult = 1;
attack_arc = 60;
attack_arc_mult = 1;
attack_length_mult = 1;

attack_cooldown = 0;

paint_damage = 0;

dash = noone;

palette = [];

passives = {};

skills = {
	"Q": noone,
	"E": noone
};

skills_casting = [];

base_stats = 
{
	max_hp: 100,
	melee_damage: 10,
	melee_damage_mult: 1,
	attack_spd: 2,
	attack_spd_mult: 1,
	in_paint_spd_mult: 1,
	melee_knockback: 12,
	melee_knockback_mult: 1,
	attack_arc: 60,
	attack_arc_mult: 1,
	attack_length_mult: 1,
	paint_damage: 0
}

function reset_stats()
{
	max_hp = base_stats.max_hp;
	melee_damage = base_stats.melee_damage;
	melee_damage_mult = base_stats.melee_damage_mult;
	attack_spd = base_stats.attack_spd;
	attack_spd_mult = base_stats.attack_spd_mult;
	in_paint_spd_mult = base_stats.in_paint_spd_mult;
	melee_knockback = base_stats.melee_knockback;
	melee_knockback_mult = base_stats.melee_knockback_mult;
	attack_arc = base_stats.attack_arc;
	attack_arc_mult = base_stats.attack_arc_mult;
	attack_length_mult = base_stats.attack_length_mult;
}

function add_palette_swatch(palette_swatch)
{
	array_push(palette, palette_swatch);
	update_color();
}

function update_color()
{
	var base_color = #E6E6E6;
	var color = base_color;
	
	for (var i = 0; i < array_length(palette); i++)
	{
		var swatch = palette[i];
		color = merge_color(color, swatch.color, 0.2);
	}
	
	self.color = color;
}

function add_passive(passive)
{
	if variable_struct_exists(passives, passive)
	{
		passives[$ passive] += 1;
	}
	else
	{
		passives[$ passive] = 1;
	}
	if variable_struct_exists(global.passives[$ passive], "gain")
	{
		global.passives[$ passive].gain(self, passives[$ passive]);
	}
	apply_passives();
}

function apply_passives()
{
	reset_stats();
	
	var keys = variable_struct_get_names(passives);
	
	for (var i = 0; i < array_length(keys); i++)
	{
		var key = keys[i];
		var level = passives[$ key];
		
		var passive = global.passives[$ key];
		if variable_struct_exists(passive, "apply")
		{
			passive.apply(self, level);
		}
	}
}

function get_passive_level(passive)
{
	if variable_struct_exists(passives, passive)
	{
		return passives[$ passive];
	}
	else
	{
		return 0;
	}
}

function add_skill(_skill, slot)
{
	skills[$ slot] = {
		skill: _skill,
		cooldown: _skill.cooldown
	};
}

function has_skill(skill)
{
	var keys = variable_struct_get_names(skills);
	for (var i = 0; i < array_length(keys); i++)
	{
		var key = keys[i];
		var skl = skills[$ key];
		if skl != noone and skl.skill == skill
		{
			return true;
		}
	}
	return false;
}

function trigger_event(event, data)
{
	var keys = variable_struct_get_names(passives);
	
	for (var i = 0; i < array_length(keys); i++)
	{
		var key = keys[i];
		var passive = global.passives[$ key];
		if variable_struct_exists(passive, event)
		{
			var trigger = passive[$ event];
			var entity;
			if variable_struct_exists(data, "entity_faux")
			{
				entity = data.entity_faux;
			}
			else
			{
				entity = self;
			}
			for (var k = 0; k < array_length(trigger); k++)
			{
				trigger[k].func(entity, setup_effects(trigger[k]));
			}
		}
	}
}