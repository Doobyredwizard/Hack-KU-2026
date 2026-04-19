var cam_relx = camx + (cam_wd/2);
var cam_rely = camy + (cam_ht/2);

if instance_exists(track_obj)
{
	var dist = point_distance(cam_relx, cam_rely, track_obj.x, track_obj.y);
	var dir = point_direction(cam_relx, cam_rely, track_obj.x, track_obj.y);
	
	var cam_move_distx = lengthdir_x(dist, dir);
	var cam_move_disty = lengthdir_y(dist, dir);
	
	camx += lerp(0, cam_move_distx, follow_spd);
	camy += lerp(0, cam_move_disty, follow_spd);
}

camx = clamp(camx, 0, room_width-cam_wd);
camy = clamp(camy, 0, room_height-cam_ht);

camera_set_view_pos(camera, camx, camy);