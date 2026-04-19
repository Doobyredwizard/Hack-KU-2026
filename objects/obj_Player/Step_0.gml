var game_mgr = obj_Game_Manager;
if game_mgr.game_state_is_state(GAME_STATE.GAMEPLAY)
{
	var grid_mgr = obj_Grid_Manager;

	var right = keyboard_check(ord("D"));
	var left = keyboard_check(ord("A"));
	var up = keyboard_check(ord("W"));
	var down = keyboard_check(ord("S"));

	var attack = mouse_check_button_pressed(mb_left);
	
	var skill_q = keyboard_check_pressed(ord("Q"));
	var skill_e = keyboard_check_pressed(ord("E"));

	var spd_real = spd;

	event_inherited();
	
	if in_paint(x, y)
	{
		spd_real *= in_paint_spd_mult;
	}

	var moveh = (right-left);
	var movev = (down-up);

	if moveh != 0 and movev != 0
	{
		spd_real /= sqrt(2);
	}
	
	image_speed = 1;

	if dash == noone
	{
		hspd = moveh*spd_real;
		vspd = movev*spd_real;
		
		if hspd != 0 or vspd != 0
		{
			sprite_index = spr_Fox_Idle_Walk;
			if sign(hspd) != 0
			{
				image_xscale = sign(hspd);
			}
		}
		else
		{
			sprite_index = spr_Fox_Idle;
		}
	}
	else
	{
		sprite_index = spr_Fox_Idle;
		
		hspd = lengthdir_x(dash.spd, dash.dir);
		vspd = lengthdir_y(dash.spd, dash.dir);
		
		var tick_effects = dash.effects.tick_effects;
		if tick_effects != noone
		{
			for (var i = 0; i < array_length(tick_effects); i++)
			{
				var effect = tick_effects[i];
				
				effect.func(self, effect);
			}
		}
		
		dash.time -= delta_time/1000000;
		if dash.time <= 0
		{
			dash = noone;
		}
	}

	var force_spds = process_forces();

	hspd += force_spds[0];
	vspd += force_spds[1];
	
	if place_meeting(x+hspd, y, obj_Ground)
	{
		while !place_meeting(x+sign(hspd), y, obj_Ground)
		{
			x += sign(hspd);
		}
		hspd = 0;
	}
	
	if place_meeting(x, y+vspd, obj_Ground)
	{
		while !place_meeting(x, y+sign(vspd), obj_Ground)
		{
			y += sign(vspd);
		}
		vspd = 0;
	}

	x += hspd;
	y += vspd;
	
	//On move event
	trigger_event("on_move", 
		{
			x: x,
			y: y
		}
	)

	////Paint tiles
	//var paintx = x div 32;
	//var painty = y div 32;

	//if grid_mgr.check_tile_color(painty, paintx) != color
	//{
	//	grid_mgr.paint_tile(painty, paintx, color);
	//}

	if attack
	{
		if attack_cooldown <= 0
		{
			var brush = instance_create_layer(x, y, "Instances_Top", obj_Paintbrush);
			brush.owner = self;
			brush.team = team;
			var dir = point_direction(x, y, mouse_x, mouse_y);
			var brush_dir = choose(-1, 1);
			brush.brush_dir = brush_dir;
			brush.image_yscale = attack_length_mult;
			brush.arc_angle = attack_arc*attack_arc_mult;
			brush.image_angle = dir-90-((brush.arc_angle/2)*brush_dir);
			brush.angle_start = brush.image_angle;
			brush.color = color;
			brush.damage = melee_damage*melee_damage_mult;
			brush.knockback = melee_knockback*melee_knockback_mult;
		
			attack_cooldown = 1 / (attack_spd*attack_spd_mult);
			
			trigger_event("on_attack",
				{
					x: x,
					y: y
				}
			)
		}
	}
	
	if attack_cooldown > 0
	{
		attack_cooldown -= delta_time/1000000;
	}
	
	//Use skills
	if skill_q
	{
		var skl = skills[$ "Q"];
		if skl != noone
		{
			if skl.cooldown <= 0
			{
				var effects = skl.skill.effects;
				for (var i = 0; i < array_length(effects); i++)
				{
					effects[i].func(self, setup_effects(effects[i]));
				}
				skl.cooldown = skl.skill.cooldown;
			}
		}
	}
	
	if skill_e
	{
		var skl = skills[$ "E"];
		if skl != noone
		{
			if skl.cooldown <= 0
			{
				var effects = skl.skill.effects;
				for (var i = 0; i < array_length(effects); i++)
				{
					effects[i].func(self, setup_effects(effects[i]));
				}
				skl.cooldown = skl.skill.cooldown;
			}
		}
	}
	
	//Skill cooldowns
	var keys = variable_struct_get_names(skills);
	for (var i = 0; i < array_length(keys); i++)
	{
		var key = keys[i];
		var skl = skills[$ key];
		if skl != noone
		{
			if skl.cooldown > 0
			{
				skl.cooldown -= delta_time/1000000;
			}
		}
	}
}
else
{
	image_speed = 0;
}