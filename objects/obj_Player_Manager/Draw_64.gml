var player = obj_Player;

if instance_exists(player)
{
	//Draw health bar
	draw_healthbar(6, 26, 134, 34, (player.hp/player.max_hp)*100, c_black, c_green, c_green, 0, true, true);
	draw_set_font(fnt_Candara_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_outlined(73, 26, string(player.hp) + "/" + string(player.max_hp), c_white, c_black, 1);
	
	//Draw palette
	var xoffset = 6;
	var yoffset = 40;
	for (var r = 0; r < 3; r++)
	{
		for (var c = 0; c < 7; c++)
		{
			var index = (r*7)+c;
			
			if array_length(player.palette) > index
			{
				var swatch = player.palette[index];
				draw_set_color(swatch.color);
				draw_rectangle((c*20)+xoffset, (r*20)+yoffset, (c*20)+18+xoffset, (r*20)+18+yoffset, false);
			}
			
			draw_set_color(c_gray);
			draw_line((c*20)+xoffset, (r*20)+yoffset, (c*20)+18+xoffset, (r*20)+yoffset);
			draw_line((c*20)+18+xoffset, (r*20)+yoffset, (c*20)+18+xoffset, (r*20)+18+yoffset);
			draw_line((c*20)+18+xoffset, (r*20)+18+yoffset, (c*20)+xoffset, (r*20)+18+yoffset);
			draw_line((c*20)+xoffset, (r*20)+18+yoffset, (c*20)+xoffset, (r*20)+yoffset);
		}
	}
	
	//Draw skills
	var keys = variable_struct_get_names(player.skills);
	for (var i = 0; i < array_length(keys); i++)
	{
		var key = keys[i];
		var skl = player.skills[$ key];
		if skl != noone
		{
			draw_sprite(skl.skill.icon, 0, (i*30)+18, 118);
			
			if skl.cooldown > 0
			{
				draw_set_color(c_black);
				draw_set_alpha(0.4);
				var height = 24 * (skl.cooldown/skl.skill.cooldown);
				draw_rectangle((i*30)+18-12, 130-height, (i*30)+18+12, 130, false);
				draw_set_alpha(1);
			}
			
			draw_sprite(spr_Skill_Frame, 0, (i*30)+18, 130);
			draw_set_font(fnt_Candara_12);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_outlined((i*30)+18, 130, key, c_white, c_black, 1);
		}
	}
}