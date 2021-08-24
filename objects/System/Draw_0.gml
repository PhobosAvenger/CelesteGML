/// @description

var lay_id = layer_get_id("Background");
var layer_id = layer_background_get_id(lay_id);


switch(global.currentScreen)
{ 
	case SCR_EDITOR:    #region // ON EDITOR

		// Background AREA
		layer_background_blend(layer_id, -1)
		layer_background_change(layer_id,bkg_01)
		layer_x(layer_id, camera_get_view_x(view_camera[0])/8);
		layer_y(layer_id, camera_get_view_y(view_camera[0])/8);
		layer_background_xscale(layer_id,0.5)
		layer_background_yscale(layer_id,0.5)
		
		var rm_rect_color = c_white;

		// Background Color
			draw_rectangle_color(0,0,Grid.W - 1,Grid.H - 1,BackColor,BackColor,BackColor,BackColor,false)

		// Draw limits
			draw_rectangle_color(0,0,Grid.W-1,Grid.H-1,rm_rect_color,rm_rect_color,rm_rect_color,rm_rect_color,1)
	
		// DRAW GRID ON/OFF
			if (global.showGrid)
				draw_grid(Grid.W,Grid.H,0.25,c_silver)	
		
		// Draw Cursor
			draw_cellcursor(TILESIZE, c_red, true)
	
		// DRAW CELL ID ON/OFF	
			if (global.cellID)
				cell_id(c_red)				
			
	break; #endregion

	case SCR_MAINMENU:  #region // ON DEFAULT
	
	// Snows
	for (var i = 0; i <= 32; i++){
		p = particles[i];
		p.x += p.spd;
		p.y += Sin(p.off);
		p.off += min(0.05, p.spd / 32);
		rectfill(p.x, p.y, p.x + p.s, p.y + p.s, p.c);
		if (p.x > room_width + 4)
		{
		    p.x = -4;
		    p.y = rnd(room_height);
		}
	}

		layer_background_blend(layer_id, c_black)
		layer_background_change(layer_id,-1)

	break; #endregion
}