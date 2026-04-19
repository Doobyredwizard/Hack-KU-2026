var player = obj_Player;
if explosion_time > 0
{
	var rad = lerp(0, radius, 1-(explosion_time/0.1));
	
	for (var i = 0; i < 360; i += 4)
	{
		var xx = x + lengthdir_x(rad, i);
		var yy = y + lengthdir_y(rad, i);
		
		if instance_exists(player)
		{
			part_type_color1(global.particles[$ "paint_static"], player.color);
		}
		part_particles_create(global.particle_systems[$ "part_system"], xx, yy, global.particles[$ "paint_static"], 1);
	}
	
	explosion_time -= delta_time/1000000;
	if explosion_time <= 0
	{
		instance_destroy();
	}
}