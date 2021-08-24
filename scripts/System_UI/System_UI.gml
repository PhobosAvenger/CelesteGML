// Script assets have changed for v2.3.0 see

function draw_text_shade(_x, _y,_string, _color, _font) {
	
		var _shadow = (_color ? c_black : c_white)
		
	// Font
		draw_set_font(_font)
		
	// Shadow
		draw_text_color(_x + 1, _y + 1, _string, _shadow, _shadow, _shadow, _shadow, 1)
		
	// TEXT
		draw_text_color(_x, _y, _string, _color, _color, _color, _color, 1)
		
	// Reset font
		draw_set_font(noone)
}

function draw_info(x, y, info, description, font, size, color, shadow,separator) {
	
	draw_text_advanced(x,y,info,font,size,color,shadow,fa_left,fa_top)
	draw_text_advanced(x + separator,y,description,font,size,color,shadow,fa_left,fa_top)
}

function draw_text_advanced(x,y,str,font,size,color,shadow,halign,valign) {
	
	// Font align
		draw_set_halign(halign);
		draw_set_valign(valign);
	
	// Set Font
		draw_set_font(font)
	
	if (shadow)
		draw_text_transformed_color(x+1, y+1, str,size,size,0, c_black, c_black, c_black, c_black,1)

	// Draw Text
		draw_text_transformed_color(x, y, str,size,size,0, color, color, color, color,1)
	
	// Reset font
		draw_set_font(noone)
		draw_set_halign(noone);
		draw_set_valign(noone);

}

function draw_btn_menu(_x,_y,_size,_array,_menu) {

	var color = c_black;
	
	// Mouse Position
		var _mouseX = device_mouse_x_to_gui(0);
		var _mouseY = device_mouse_y_to_gui(0);
		
	// Button Size
		var _width  = _x + _size;
		var _height = _y + _size;
		
	// Check on Hover
		var on_hover = point_in_rectangle(_mouseX, _mouseY, _x, _y, _width, _height);
	
		var outline_col = (on_hover ? c_aqua : (item_selected[_menu] = global.blockID ? c_lime : c_black ))

		if (on_hover && mouse_check_button_pressed(mb_left)) {
			
			// Close all Tiles
				for (var i = 0; i < array_length(menu_opened); i++) {
					menu_opened[i] = 0;
				}
				
				global.blockID = item_selected[_menu];
		}

		draw_rectangle_color(_x,_y,_width,_height,color,color,color,color,false)
		draw_rectangle_color(_x,_y,_width,_height,outline_col,outline_col,outline_col,outline_col,true)

	//Display Icon
		icon(item_selected[_menu],_x + 4,_y + 4,4,1)
	
		if (on_hover  && mouse_check_button_pressed(mb_right)) {
		
			// Close all Tiles
				for (var i = 0; i < array_length(menu_opened); i++) {
					menu_opened[i] = 0;
				}
		
			//log(string(menu_opened))
		    menu_opened[_menu]   = !menu_opened[_menu];
			global.blockID       = item_selected[_menu];			
		}
		
		if (menu_opened[_menu]) {
			var spacer = 40
			xx = _x + 61
			yy = _y + 4
		
			var _item = 0;
		
			for(var j = 0; j < 5; j++) {
				for(var i = 0; i < 5; i++) {
			
				if (_item < array_length(_array)) {

				xx = _x + _size + (i * spacer) + 16
				yy = _y + 4 + (j * spacer)
				width  = xx + 32;
				height =  yy + 32
			
				var onhover = point_in_rectangle(_mouseX, _mouseY, xx, yy, width, height);
			
				var outlinecol = (onhover ? c_lime : c_white )		
			
				if (onhover  && mouse_check_button_pressed(mb_left)) {
					item_selected[_menu] = _array[_item]
					menu_opened[_menu]   = !menu_opened[_menu];
					global.blockID       =_array[_item];

				}
			
					draw_rectangle_color(xx,yy, width, height,c_black,c_black,c_black,c_black, 0)
					draw_rectangle_color(xx,yy, width, height,outlinecol,outlinecol,outlinecol,outlinecol, 1)
			
					// show object icon
						icon(_array[_item],xx,yy,4,1)
				}
					_item++;
				}
			}
		}
}

function draw_btn_color(_x,_y,_size,_array,_menu) {

	var color1 = item_selected[_menu][0];
	var color2 = item_selected[_menu][1];
	
	// Mouse Position
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);
	// Button Size
	var _width  = _x + _size;
	var _height = _y + _size;
	// Check on Hover
	var on_hover = point_in_rectangle(_mouseX, _mouseY, _x, _y, _width, _height);
	
	var outline_col = (on_hover ? c_aqua : (item_selected[_menu] = global.blockID ? c_lime : c_black ))

	draw_rectangle_color(_x,_y,_width,_height,color2,color2,color1,color1,false)
	draw_rectangle_color(_x,_y,_width,_height,outline_col,outline_col,outline_col,outline_col,true)
	
	if (on_hover  && mouse_check_button_pressed(mb_left)) {
	    menu_opened[_menu]   = !menu_opened[_menu];
	}
		
	if (menu_opened[_menu]) {
		var spacer = 40
		xx = _x + 61
		yy = _y + 4
		
		var _item = 0;
		log(string(_array))
		
		for(var j = 0; j < 3; j++) {
			for(var i = 0; i < 3; i++) {
			
			if (_item < array_length(_array)) {
			
			xx = _x + _size + (i * spacer) + 16
			yy = _y + 4 + (j * spacer)
			width  = xx + 32;
			height =  yy + 32
			
			var onhover = point_in_rectangle(_mouseX, _mouseY, xx, yy, width, height);
			
			var outlinecol = (onhover ? c_lime : c_white )		
			
			if (onhover  && mouse_check_button_pressed(mb_left)) {
				item_selected[_menu] = _array[_item]
				menu_opened[_menu]   = !menu_opened[_menu];
				
				// Update Background Preset color
					BackColor	= _array[_item][0];
					CloudColor	= _array[_item][1];
				
				// Update Struct Json
					_MapFile._roomData[global.currentLevel].bkgColor = BackColor;
					_MapFile._roomData[global.currentLevel].cldColor = CloudColor;
				
			}
				var col = _array[_item]
				
				draw_rectangle_color(xx,yy, width, height,col[0],col[0],col[1],col[1], 0)
				draw_rectangle_color(xx,yy, width, height,outlinecol,outlinecol,outlinecol,outlinecol, 1)

			}
				_item++;
			}
		}
	}
}
	
function draw_btn(_x,_y,_size,_type) {

	// Set ui sprite
		var _sprite = s_ui_btn;
		var _index  = 0;
		
	// Determines Button Function
		switch(_type) 
			{
				case "backroom": _index = 0; break;
				case "nextroom": _index = 0; break;
				case "addroom":  _index = 1; break;		  
				case "delroom":  _index = 2; break;
				case "testroom":  _index = 3; break;
			}
	
	// Mouse Position
		var _mouseX = device_mouse_x_to_gui(0);
		var _mouseY = device_mouse_y_to_gui(0);
	
	// Button Size
		var _width  = _x + _size;
		var _height = _y + _size;;
	
	// Check on Hover
		var on_hover    = point_in_rectangle(_mouseX, _mouseY, _x, _y, _width, _height);
		var hover_col   = (on_hover ? c_gray : c_dkgray)
		var outline_col = (on_hover ? c_aqua : c_white)
	
	// On Pressed
		if (on_hover && mouse_check_button_pressed(mb_left)) 
			{
				if (_type == "backroom")
					_roomselect("back")
				else if (_type == "nextroom")
					_roomselect("next")
				else if (_type == "addroom")
					_addRoom()
				else if (_type == "delroom")
					_delRoom()
				else if (_type == "testroom") {
					
				// Align Game Camera
					camera_set_view_size(view_camera[0], 256, 128);
					camera_set_view_pos(view_camera[0], -CAMX, CAMY);
					
				// check is custom
					_iscustom = true;
					
					global.maxRooms = array_length(_MapFile._roomData)-1
					
				// Test Current Map		
					_mapCurr    = 0;				
					_mapData	= _MapFile._roomData[_mapCurr].mapData
					_mapHeight  = _MapFile._roomData[_mapCurr].mapHeight / TILESIZE
					BackColor	= _MapFile._roomData[_mapCurr].bkgColor
					CloudColor	= _MapFile._roomData[_mapCurr].cldColor	
				
				// Create Game Instance
					instance_create_layer(x,y,layer,GameSystem);
				
				// Set is Editor Mode
					global.currentScreen = SCR_TEST_ROOM;		
				 }
			}
	
	// On Click
		if (on_hover && mouse_check_button(mb_left)) {
			hover_col   = c_white
			outline_col = c_black
		}
	// Draw Rectangles
		draw_rectangle_color(_x,_y,_width,_height,hover_col,hover_col,hover_col,hover_col,false)
		draw_rectangle_color(_x,_y,_width,_height,outline_col,outline_col,outline_col,outline_col,true)
	
	// Draw the UI icon
		draw_sprite_ext(_sprite,_index,_x + 20,_y + 20,(_type = "backroom" ? -1 : 1),image_yscale,image_angle,image_blend,image_alpha)
}	
	
function icon(sprite, X, Y, size,alpha) {
	
	var columns = (argument_count > 5) ? argument[6] : 1,
		rows	= (argument_count > 6) ? argument[7] : 1;

	sprite = (sprite > 0) ? sprite : 1;
	
	for (var sx = 0; sx < columns; sx++)
	{
	   for (var sy = 0; sy < rows; sy++)
		{
			var _spr = System.sprites[sprite + sx + sy * 16];

			draw_sprite_part_ext(atlas, 0, _spr[0], _spr[1], 8, 8, X, Y, size, size, image_blend, alpha)		
		}
	}
}

function show_msg(text) {
	timerText = timerTextReset;
	current_text = text;
}