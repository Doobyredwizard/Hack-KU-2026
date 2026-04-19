global.passives =
{
	attack_damage:
	{
		name: "Attack Damage",
		color: #CC0000,
		levels: [0.2, 0.4, 0.6, 0.8, 1],
		apply: passive_attack_damage
	},
	
	attack_speed:
	{
		name: "Attack Speed",
		color: #FF6A00,
		levels: [0.25, 0.5, 0.75, 1, 1.25],
		apply : passive_attack_speed
	},
	
	in_paint_speed:
	{
		name: "In Paint Speed",
		color: #0060FF,
		levels: [0.2, 0.4, 0.6, 0.8, 1],
		apply : passive_in_paint_speed
	},
	
	knockback:
	{
		name: "Knockback",
		color: #FFB500,
		levels: [0.25, 0.5, 0.75, 1, 1.25],
		apply: passive_knockback
	},
	
	attack_arc:
	{
		name: "Attack Arc",
		color: #FF006A,
		levels: [0.2, 0.4, 0.6, 0.8, 1],
		apply: passive_attack_arc
	},
	
	attack_length:
	{
		name: "Attack Length",
		color: #CD00D6,
		levels: [0.2, 0.4, 0.6, 0.8, 1],
		apply: passive_attack_length
	},
	
	max_hp:
	{
		name: "Max HP",
		color: #00FF0B,
		levels: [20, 40, 60, 80, 100],
		apply: passive_max_hp,
		gain: passive_max_hp_gain
	},
	
	toxic_paint:
	{
		name: "Toxic Paint",
		color: #00FF95,
		levels: [0.25, 0.5, 0.75, 1, 1.25],
		apply: passive_toxic_paint
	},
	
	paint_steps:
	{
		name: "Paint Steps",
		color: #00DFFF,
		levels: [-1],
		on_move: [
			{
				func: effect_aoe_paint,
				params: {
					radius: 1
				}
			}
		]
	},
	
	attack_blob:
	{
		name: "Attack Blob",
		color: #BF00FF,
		levels: [-1],
		on_attack: [
			{
				func: effect_projectile_create,
				params: {
					damage: 0,
					spd: 6,
					drag: 1,
					lifetime: 0.5,
					can_contact_damage: false
				},
				visual: -1,
				
				tick_effects: [
					{
						func: effect_aoe_paint,
						params: {
							radius: 1
						}
					},
					{
						func: visual_effect_particles_create,
						params: {
							particle_type: "paint_blob",
							particle_count: 10,
							particle_system: "part_system_back"
						}
					}
				]
			}
		]
	},
	
	random_bombs:
	{
		name: "Random Bombs",
		color: #9FFF00,
		levels: [-1],
		on_enemy_death: [
			{
				func: effect_chance,
				params: {
					chance: 0.1
				},
				
				chance_effects: [
					{
						func: effect_projectile_create,
						params: {
							damage: 0,
							spd: 0,
							drag: 1,
							lifetime: 0.5,
							can_contact_damage: false
						},
						
						visual: visual_paint_bomb,
						
						expire_effects: [
							{
								func: effect_aoe_damage,
								tags: ["aoe", "damage"],
								params: {
									radius: 64,
									damage: 5,
									knockback: 8
								}
							},
							{
								func: effect_aoe_paint,
								params: {
									radius: 2
								}
							},
							{
								func: visual_effect_particle_explosion,
								params: {
									radius: 64
								}
							}
						]
					}
				]
			}
		]
	}
}

global.passives_list = [
	"attack_damage",
	"attack_speed",
	"in_paint_speed",
	"knockback",
	"attack_arc",
	"attack_length",
	"max_hp",
	"toxic_paint",
	"paint_steps",
	"attack_blob",
	"random_bombs"
];