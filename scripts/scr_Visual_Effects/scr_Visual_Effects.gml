function visual_effect_particles_create(source, veffect)
{
	var player = obj_Player;
	
	var pt = global.particles[$ veffect.params.particle_type];
	if instance_exists(player)
	{
		part_type_color1(pt, player.color);
	}
	var particle_count = veffect.params.particle_count;
	var pts = global.particle_systems[$ veffect.params.particle_system];
	part_particles_create(pts, source.x, source.y, pt, particle_count);
}

function visual_effect_particle_explosion(source, veffect)
{
	var explosion = instance_create_layer(source.x, source.y, "Instances", obj_Visual_Effect_Explosion);
	explosion.radius = veffect.params.radius;
}