event_inherited();

can_contact_damage = true;

spd = 0;
dir = 0;

hspd = 0;
vspd = 0;

drag = 0;
lifetime = 0;

effects = noone;
visual = visual_default

function hit_entity(entity)
{
	entity.hit_receive(self);
	
	var hit_effects = effects.hit_effects;
	if hit_effects != noone
	{
		for (var i = 0; i < array_length(hit_effects); i++)
		{
			var effect = hit_effects[i];
				
			effect.func(self, effect);
		}
	}
	
	instance_destroy();
}

function projectile_expire()
{
	var expire_effects = effects.expire_effects;
	if expire_effects != noone
	{
		for (var i = 0; i < array_length(expire_effects); i++)
		{
			var effect = expire_effects[i];
				
			effect.func(self, effect);
		}
	}
	
	instance_destroy();
}