draw_set_font(fnt_Candara_12);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_outlined(320, 0, "Wave: " + string(wave_count) + "/" + string(total_waves), c_white, c_black, 1);
draw_text_outlined(320, 14, "Wave Time: " + string(floor(wave_time)), c_white, c_black, 1);