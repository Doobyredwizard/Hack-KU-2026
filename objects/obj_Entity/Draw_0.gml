draw_self();
if flash > 0
{
	shader_set(shd_Hit_Flash);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, flash);
	shader_reset();
}