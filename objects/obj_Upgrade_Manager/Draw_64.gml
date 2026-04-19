if show_choices
{
	var camera = view_camera[0];
	var cw = camera_get_view_width(camera);
	var ch = camera_get_view_height(camera);
	draw_set_font(fnt_Candara_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_outlined(cw/2, 96, "Right Click to Select Upgrade", c_white, c_black, 1);
	for (var i = 0; i < array_length(upgrade_choices); i++)
	{
		draw_set_color(#CCCCCC);
		draw_rectangle((cw/2)-128, (i*72)+96, (cw/2)+128, (i*72)+160, false);
		
		draw_set_color(c_black);
		draw_line((cw/2)-128, (i*72)+96, (cw/2)+128, (i*72)+96);
		draw_line((cw/2)+128, (i*72)+96, (cw/2)+128, (i*72)+160);
		draw_line((cw/2)+128, (i*72)+160, (cw/2)-128, (i*72)+160);
		draw_line((cw/2)-128, (i*72)+160, (cw/2)-128, (i*72)+96);
		
		var upgr = upgrade_choices[i];
		var type = upgr.type;
		var swatch;
		var type_name;
		switch type
		{
			case "passive":
				swatch = global.passives[$ upgr.upgrade];
				type_name = "Passive";
				break;
			case "skill":
				swatch = global.skills[$ upgr.upgrade];
				type_name = "Skill";
				break;
		}
		
		draw_set_font(fnt_Candara_12);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_outlined((cw/2)-128+6, (i*72)+96, swatch.name, c_white, c_black, 1);
		
		draw_text_outlined((cw/2)-128+6, (i*72)+112, type_name, c_white, c_black, 1);
		
		draw_set_color(swatch.color);
		draw_rectangle((cw/2)+128-8-16, (i*72)+96+8, (cw/2)+128-8, (i*72)+96+24, false);
		
		draw_set_color(c_black);
		draw_line((cw/2)+128-8-16, (i*72)+96+8, (cw/2)+128-8, (i*72)+96+8);
		draw_line((cw/2)+128-8, (i*72)+96+8, (cw/2)+128-8, (i*72)+96+24);
		draw_line((cw/2)+128-8, (i*72)+96+24, (cw/2)+128-8-16, (i*72)+96+24);
		draw_line((cw/2)+128-8-16, (i*72)+96+24, (cw/2)+128-8-16, (i*72)+96+8);
	}
}