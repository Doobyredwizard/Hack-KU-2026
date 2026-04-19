if other.team != team and other.can_contact_damage
{
	if !ds_map_exists(other.hit_list, id)
	{
		other.hit_list[? id] = other.hit_cooldown_frames;
		other.hit_entity(self);
	}
}