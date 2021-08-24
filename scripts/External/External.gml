// Script assets have changed for v2.3.0 see

function global_grid(w, c, size) {
	
	draw_line_width_color(-4096,-1,4096,-1,w,c_blue,c_blue);
	draw_line_width_color(-1,-4096,-1,4096,w,c_blue,c_blue);

	draw_set_alpha(0.5);
	draw_set_color(c)

	for (var i = -4097; i < 4096 + base_height; i+=size) {
		draw_line_width(-4097,i,4096 + base_width,i,w);
	}

	for (var i = -4097; i < 4096 + base_width; i+=size) {
		draw_line_width(i,-4097,i,4096 + base_height,w);
	}

	draw_set_alpha(1);
}

function editor_zoom_update(screen_width, screen_height,currentX,currentY, viewX, viewY, viewW, viewH) {

	var _mX = (currentX - viewX) / viewW;
	var _mY = (currentY - viewY) / viewH;

	camera_set_view_size(view_camera[0],screen_width/zoom,screen_height/zoom);
	var _viewX = (screen_width/zoom) * _mX;
	var _viewY = (screen_height/zoom) * _mY;
	
	camX = currentX - _viewX;
	camY = currentY - _viewY;
}
