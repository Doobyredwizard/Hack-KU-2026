global.particle_systems = {};

var pts;

pts = part_system_create();

global.particle_systems[$ "part_system"] = pts;

pts = part_system_create();
part_system_depth(pts, 201);

global.particle_systems[$ "part_system_back"] = pts;

global.particles = {};

var pt;

pt = part_type_create();
part_type_sprite(pt, spr_Particle_Paint, false, false, false);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.2, 0.4, 0, 0);
part_type_life(pt, 20, 40);
part_type_alpha2(pt, 1, 0);

global.particles[$ "paint_blob"] = pt;

pt = part_type_create();
part_type_sprite(pt, spr_Particle_Paint, false, false, false);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.1, 0.2, 0, 0);
part_type_life(pt, 10, 20);
part_type_alpha2(pt, 1, 0);

global.particles[$ "paint_static"] = pt;

pt = part_type_create();
part_type_sprite(pt, spr_Particle_Paint, false, false, false);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 1, 2, 0, 0);
part_type_life(pt, 20, 40);
part_type_alpha2(pt, 1, 0);

global.particles[$ "paint_burst"] = pt;

pt = part_type_create();
part_type_sprite(pt, spr_Particle_Colorless, false, false, false);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.8, 0.8, 0, 0);
part_type_life(pt, 20, 20);
part_type_alpha2(pt, 1, 0);

global.particles[$ "colorless_vacuum"] = pt;