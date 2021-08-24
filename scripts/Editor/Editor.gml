// Script assets have changed for v2.3.0 see

function on_levelgrid(limit_width,limit_height) {
	if (mouse_x > 0 && mouse_x < limit_width) && (mouse_y > 0 && mouse_y < limit_height) 
		return true
}

function draw_chunk_limit(chunk_width,chunk_height,line_Color,line_width) {	

	//Draw room Limits
	for (var i = 127; i < chunk_width; i+=128)
		draw_line_width_color(i,-1,i,chunk_height - 1,line_width,line_Color,line_Color);		
}

function draw_cellcursor(cs, color,outline) {
	
	// Define area to Draw Cellcursor
		if (!on_levelgrid(Grid.W,Grid.H))
			return;

	// Define Mouse Coordinates div by cellsize
		var xx   = mouse_x div cs;
		var yy	 = mouse_y div cs;
		
	// Apply snap grid cell
		xx = xx*cs;
		yy = yy*cs;
		
	// Define Grid Limits
		xx = clamp(xx, 0, Grid.W);
		yy = clamp(yy, 0, Grid.H);
	
	// Draw Sprite Icon
		icon(global.blockID,xx,yy,1,0.5)

		if (global.blockID == 60)			/*     TREE     */
		{
			icon(global.blockID-16,xx,yy-8,1,0.5) // Top
		}
		else if (global.blockID == 80)		/*   FAKE WALL    */
		{
			icon(global.blockID-16,xx,yy-8,1,0.5) // Top Left
			icon(global.blockID-15,xx+8,yy-8,1,0.5) // Top Right
			icon(global.blockID+1,xx+8,yy,1,0.5) // Bottom Right 
		}
		else if (global.blockID == 86)			/*   FAKE WALL    */
		{
			icon(global.blockID-16,xx,yy-8,1,0.5) // Top Left
			icon(global.blockID-15,xx+8,yy-8,1,0.5) // Top Right
			icon(global.blockID+1,xx+8,yy,1,0.5) // Bottom Right 
		}
		else if (global.blockID == 112)			/*   FAKE WALL    */
		{
			icon(global.blockID-16,xx,yy-8,1,0.5) // Top Left
			icon(global.blockID-15,xx+8,yy-8,1,0.5) // Top Right
			icon(global.blockID+1,xx+8,yy,1,0.5) // Bottom Right 
		}
		
		
	// Draw Rectangle
		draw_set_alpha(0.7);
		draw_rectangle_color(xx+(cs/2)-4,yy+(cs/2)-4,xx+(cs/2)+3,yy+(cs/2)+3,color,color,color,color,outline)
		draw_set_alpha(1);
}

function draw_grid_coordinates(posX,posY,xx,yy,separator,BackColor,textColor,outline) {
		
	// Draw Rectangle X & Y
	draw_set_alpha(0.5);
	draw_rectangle_color(16,posY-56,64,posY-8,BackColor,BackColor,BackColor,BackColor,false)
	draw_set_alpha(1);
	
	// outline
	if (outline)
		draw_rectangle_color(16,posY-56,64,posY-8,c_white,c_white,c_white,c_white,outline)
	
	// Define area to Draw Cellcursor
	if (!on_levelgrid(Grid.W,Grid.H))
		return;
		
	// Font Align
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// Draw Coordiantes
	draw_info(24,posY-48, "X :",xx,fnt_sys_10,1,textColor,true,separator)
	draw_info(24,posY-32,"Y :",yy,fnt_sys_10,1,textColor,true,separator)
}

function cell_id(font_color) {
	
		var _id = 0;
		
		for(var _y = -1; _y < mapH*TILESIZE - 8; _y+=8) {
			for(var _x = -1; _x < mapW*TILESIZE - 8; _x+=8) {

			
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_text_transformed_color(5 + _x, 5 + _y, string(_id),0.2,0.2,0,font_color,font_color,font_color,font_color,1)
			_id++;
		}
	}
}

function cell_id2(font_color) {
	
	var _Height = _MapFile._roomData[global.currentLevel].mapHeight/TILESIZE;
	var _Width =  _MapFile._roomData[global.currentLevel].mapWidth/TILESIZE;	
		
	for (var w = 0; w < _Height; w++)
	{
		for(var h = 0; h < _Width; h++)
		{
			
			tile = _MapFile._roomData[global.currentLevel].mapData[w + h * (_Height)];
			var xx = w * TILESIZE;
			var yy = h * TILESIZE;
			
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			draw_text_transformed_color(5 + xx, 5 + yy, tile,0.3,0.3,0,font_color,font_color,font_color,font_color,1)
		}
	}
}

function draw_grid(gridW,gridH,w, c) {

	// Set Alpha
	draw_set_alpha(0.5);

	// Draw Horizontal Lines
	for (var i = -1; i < gridH; i+=8)
		draw_line_width_color(-1,i,gridW - 1,i,w,c,c);

	// Draw Vertical Lines
	for (var i = -1; i < gridW; i+=8) 
		draw_line_width_color(i,-1,i,gridH - 1,w,c,c);	
	
	// Reset Alpha
	draw_set_alpha(1);
}

function main_grid(xx, yy, tilesize) {

	var left_border   = tilesize - tilesize;
	var top_border    = tilesize - tilesize;
	var right_border  = Grid.W - tilesize;
	var bottom_border = Grid.H - tilesize;

	var horizontal_axis = (xx >= left_border) && (xx <= right_border)
	var vertical_axis   = (yy >= top_border)  && (yy <= bottom_border)

	return horizontal_axis && vertical_axis;
}


function room_clear() {
	
	// Restore Struct defaults
		_MapFile._roomData[global.currentLevel].mapData = array_create(mapW*mapH,0)

	with(oBlock) {
		instance_destroy(self);
	}
}