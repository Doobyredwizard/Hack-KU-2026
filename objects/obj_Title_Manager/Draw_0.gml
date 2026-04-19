draw_set_font(fnt_Candara_12);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_text_outlined(320, 96, "Choose.", c_white, c_black, 1);

draw_set_color(#CCCCCC);

draw_rectangle(160, 112, 288, 144, false);

draw_rectangle(352, 112, 480, 144, false);

draw_set_valign(fa_middle);

draw_text_outlined(224, 128, "Normal", c_white, c_black, 1);

draw_text_outlined(416, 128, "Hyper", c_white, c_black, 1);