global.skills =
{
	paint_roller:
	{
		name: "Paint Roller",
		color: #5500FF,
		effects: [
			{
				func: effect_start_dash,
				tags: ["cast"],
				params: {
					spd: 12,
					duration: 0.3
				},
				
				tick_effects: [
					{
						func: effect_aoe_damage,
						tags: ["aoe", "damage", "tick"],
						params: {
							radius: 64,
							damage: 10,
							knockback: 16
						}
					},
					{
						func: effect_aoe_paint,
						params: {
							radius: 2
						}
					}
				]
			}
		],
		cooldown: 4,
		icon: spr_Skill_Paint_Roller
	},
	
	paint_bomb:
	{
		name: "Paint Bomb",
		color: #BF00FF,
		effects: [
			{
				func: effect_projectile_create,
				tags: ["cast"],
				params: {
					damage: 0,
					spd: 6,
					drag: 0.9,
					lifetime: 1,
					can_contact_damage: false
				},
				
				visual: visual_paint_bomb,
				
				expire_effects: [
					{
						func: effect_aoe_damage,
						tags: ["aoe", "damage", "tick"],
						params: {
							radius: 96,
							damage: 20,
							knockback: 20
						}
					},
					{
						func: effect_aoe_paint,
						params: {
							radius: 3
						}
					},
					{
						func: visual_effect_particle_explosion,
						params: {
							radius: 96
						}
					}
				]
			}
		],
		cooldown: 6,
		icon: spr_Skill_Paint_Bomb
	},
	
	paint_pulser:
	{
		name: "Paint Pulser",
		color: #00ff8a,
		effects: [
			{
				func: effect_construct_create,
				tags: ["cast"],
				params: {
					lifetime: 6
				},
				visual: visual_pulser,
				
				pulse_effects: [
					{
						func: effect_aoe_damage,
						tags: ["aoe", "damage", "tick"],
						params: {
							radius: 96,
							damage: 5,
							knockback: 10
						},
						pulse_reset_time: 1
					},
					{
						func: effect_aoe_paint,
						params: {
							radius: 3
						},
						pulse_reset_time: 1
					},
					{
						func: visual_effect_particle_explosion,
						params: {
							radius: 96
						},
						pulse_reset_time: 1
					}
				]
			}
		],
		cooldown: 12,
		icon: spr_Skill_Paint_Pulser
	},
	
	paint_drone:
	{
		name: "Paint Drone",
		color: #0020FF,
		effects: [
			{
				func: effect_projectile_create,
				tags: ["cast"],
				params: {
					damage: 0,
					spd: 10,
					drag: 1,
					lifetime: 3,
					can_contact_damage: false
				},
				visual: visual_drone,
				
				tick_effects: [
					{
						func: effect_aoe_paint,
						params: {
							radius: 2
						}
					}
				]
			}
		],
		cooldown: 8,
		icon: spr_Skill_Paint_Drone
	},
	
	paintwave:
	{
		name: "Paintwave",
		color: #FF00D4,
		effects: [
			{
				func: effect_aoe_damage,
				tags: ["aoe", "damage"],
				params: {
					radius: 128,
					damage: 15,
					knockback: 20
				}
			},
			{
				func: effect_aoe_paint,
				params: {
					radius: 4
				}
			},
			{
				func: visual_effect_particle_explosion,
				params: {
					radius: 128
				}
			}
		],
		cooldown: 10,
		icon: spr_Skill_Paintwave
	},
	
	goop_shot:
	{
		name: "Goop Shot",
		color: #FF4000,
		effects: [
			{
				func: effect_projectile_create,
				tags: ["cast"],
				params: {
					damage: 7,
					spd: 8,
					drag: 1,
					lifetime: 0.8,
					can_contact_damage: true
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
							particle_count: 20,
							particle_system: "part_system"
						}
					}
				],
				
				hit_effects: [
					{
						func: effect_aoe_damage,
						tags: ["aoe", "damage"],
						params: {
							radius: 48,
							damage: 5,
							knockback: 6
						}
					},
					{
						func: effect_aoe_paint,
						params: {
							radius: 1.5
						}
					},
					{
						func: visual_effect_particles_create,
						params: {
							particle_type: "paint_burst",
							particle_count: 40,
							particle_system: "part_system"
						}
					}
				]
			}
		],
		cooldown: 2,
		icon: spr_Skill_Goop_Shot
	}
}

global.skills_list = [
	"paint_roller",
	"paint_bomb",
	"paint_pulser",
	"paint_drone",
	"paintwave",
	"goop_shot"
];