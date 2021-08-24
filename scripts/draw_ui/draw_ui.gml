/// desc camera(fx, fy)
/// @arg fx
/// @arg fy
function camera(cx,cy) {
	if (argument_count > 2)
	{
		var fx = argument[2]
		var fy = argument[3]
		camera_set_view_pos(view_camera[0],cx + round(fx), cy +round(fy));
	}
	else
	{
		camera_set_view_pos(view_camera[0], cx, cy);
	}
}