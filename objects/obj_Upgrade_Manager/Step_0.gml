var game_mgr = obj_Game_Manager;
if game_mgr.game_state_is_state(GAME_STATE.UPGRADE)
{
	var player = obj_Player;
	if instance_exists(player)
	{
		if show_choices
		{
			var camera = view_camera[0];
			var cw = camera_get_view_width(camera);
			var ch = camera_get_view_height(camera);
			var cx = camera_get_view_x(camera);
			var cy = camera_get_view_y(camera);
			var mcx = mouse_x-cx;
			var mcy = mouse_y-cy;
			for (var i = 0; i < array_length(upgrade_choices); i++)
			{
				if point_in_rectangle(mcx, mcy, (cw/2)-128, (i*72)+96, (cw/2)+128, (i*72)+160)
				{
					if mouse_check_button(mb_right)
					{
						var upgr = upgrade_choices[i];
						var type = upgr.type;
						var swatch;
						switch type
						{
							case "passive":
								swatch = global.passives[$ upgr.upgrade];
								player.add_passive(upgr.upgrade);
								break;
							case "skill":
								swatch = global.skills[$ upgr.upgrade];
								var keys = variable_struct_get_names(player.skills);
								var slot = "";
								for (var k = 0; k < array_length(keys); k++)
								{
									var key = keys[k];
									if player.skills[$ key] == noone
									{
										slot = key;
										break;
									}
								}
								if slot != ""
								{
									player.add_skill(swatch, slot);
								}
								break;
						}

						player.add_palette_swatch(new PaletteSwatch(swatch.color));
						array_delete(upgrade_choices, 0, array_length(upgrade_choices));
						show_choices = false;
						game_mgr.pop_game_state();
					}
				}
			}
		}
	}
}