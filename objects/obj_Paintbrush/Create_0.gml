event_inherited();

owner = noone;
color = -1;

arc_angle = 60;
angle_start = 0;
brush_dir = 1;

brush_dur = 0.1;
brush_time = 0;

damage = 10;
knockback = 12;
hit_cooldown_frames = 0.1*60;
can_contact_damage = true;

//Brush particles
pt_brush = part_type_create()
part_type_sprite(pt_brush, spr_Particle_Paint, false, false, false);
part_type_orientation(pt_brush, 0, 360, 0, 0, 0);
part_type_speed(pt_brush, 0.2, 0.4, 0, 0);
part_type_life(pt_brush, 5, 10);
part_type_alpha2(pt_brush, 1, 0);