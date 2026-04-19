team = -1;

hit_list = ds_map_create();

damage = 0;
knockback = 0;
hit_cooldown_frames = 30;
can_contact_damage = false;

function hit_entity(entity)
{
	entity.hit_receive(self);
}