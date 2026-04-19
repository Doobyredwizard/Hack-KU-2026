function Hit(damage, knockback, knockback_dir, source) constructor
{
	self.damage = damage;
	self.knockback = knockback;
	self.knockback_dir = knockback_dir;
	self.source = source;
}

function Force(strength, dir, decay) constructor
{
	self.strength = strength;
	self.dir = dir;
	self.decay = decay;
}

function EntityFaux(x, y, team) constructor
{
	self.x = x;
	self.y = y;
	self.team = team;
}

function setup_effects(effect)
{
	var effects = variable_clone(effect);
	effects.tick_effects = noone;
	effects.expire_effects = noone;
	effects.pulse_effects = noone;
	effects.hit_effects = noone;
	if variable_struct_exists(effect, "tick_effects")
	{
		effects.tick_effects = variable_clone(effect.tick_effects);
		
		for (var i = 0; i < array_length(effects.tick_effects); i++)
		{
			var ef = effects.tick_effects[i];
			effects.tick_effects[i] = setup_effects(ef);
		}
	}
	if variable_struct_exists(effect, "expire_effects")
	{
		effects.expire_effects = variable_clone(effect.expire_effects);
		
		for (var i = 0; i < array_length(effects.expire_effects); i++)
		{
			var ef = effects.expire_effects[i];
			effects.expire_effects[i] = setup_effects(ef);
		}
	}
	if variable_struct_exists(effect, "pulse_effects")
	{
		effects.pulse_effects = variable_clone(effect.pulse_effects);

		for (var i = 0; i < array_length(effects.pulse_effects); i++)
		{
			var ef = effects.pulse_effects[i];
			effects.pulse_effects[i] = setup_effects(ef);
			effects.pulse_effects[i].pulse_time = ef.pulse_reset_time;
		}
	}
	if variable_struct_exists(effect, "hit_effects")
	{
		effects.hit_effects = variable_clone(effect.hit_effects);

		for (var i = 0; i < array_length(effects.hit_effects); i++)
		{
			var ef = effects.hit_effects[i];
			effects.hit_effects[i] = setup_effects(ef);
		}
	}
	if variable_struct_exists(effect, "tags")
	{
		var tags = effect.tags;
		
		for (var i = 0; i < array_length(tags); i++)
		{
			setup_effect_tag(effects, tags[i]);
		}
	}
	return effects;
}

function setup_effect_tag(effect, tag)
{
	switch tag
	{
		case "damage":
			effect.hit_list = ds_map_create();
			break
	}
}