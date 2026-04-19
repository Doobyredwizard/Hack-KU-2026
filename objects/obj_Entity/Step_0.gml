if iframes > 0
{
	iframes--;
}

process_hit_list();

if flash > 0
{
	flash -= flash_drain_spd;
}