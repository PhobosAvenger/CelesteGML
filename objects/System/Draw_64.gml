/// @description 

// GUI SIZE
display_set_gui_size(1366,768)

var gW = display_get_gui_width();
var gH = display_get_gui_height();

	draw_set_font(fnt_sys_10);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_color(c_silver)
	draw_text(gW-32,gH-32,"GML Version by Phobos & GFdants");
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);

switch(global.currentScreen) {
	
	case SCR_MAINMENU:  #region // Draw Menu
	// Draw Logo
	draw_sprite_ext(CelesteLogo,0,(gW/3),(gH/8),8,8,0,image_blend,image_alpha)

	// Menu
	draw_set_font(menu_font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	for (var i = 0; i < menu_items; i++)
	{
		var offset = 2;
		var txt = menu[i];
	
		if (menu_cursor == i)
			{
			    txt = string_insert("> ", txt, 0);
			    var col = c_white;
			}
		else
			{
			    var col = c_gray;
			}
	
		var xx = menu_x;
		var yy = menu_y - (menu_itemheight * (i * 3));
		draw_set_color(c_blue);
		draw_text(xx-offset,yy,txt);
		draw_text(xx+offset,yy,txt);
		draw_text(xx,yy+offset,txt);
		draw_text(xx,yy-offset,txt);
		draw_set_color(col);
		draw_text(xx,yy,txt);
	}
	break; #endregion	
	case SCR_EDITOR:    #region // Draw Editor
	
		if (timerText != 0) {
			draw_set_halign(fa_middle);
			draw_text_shade(gW/2,gH-64,string(current_text),c_white,fnt_sys_21_bold)
			draw_set_halign(fa_left);
		}	
		
			// Draw main bar
				draw_rectangle_color(0,0,gW,64,c_dkgrey,c_dkgrey,c_black,c_black,false)
				draw_rectangle_color(4,4,gW-4,60,c_silver,c_silver,c_silver,c_silver,true)
		
			// Draw Rectangle X & Y
				draw_set_alpha(0.5);
				draw_rectangle_color(0,65,56,gH,c_black,c_black,c_black,c_black,false)
				draw_set_alpha(1);

			// Draw Room Count Rect
				draw_rectangle_color(639,8,727,56,c_gray,c_gray,c_dkgrey,c_dkgrey,false)
				draw_rectangle_color(639,8,727,56,c_silver,c_silver,c_silver,c_silver,true)
			
			// NEW SAVE LOAD Bar
				draw_rectangle_color(64,8,216,56,c_gray,c_gray,c_dkgrey,c_dkgrey,false)
				draw_rectangle_color(64,8,216,56,c_silver,c_silver,c_silver,c_silver,true)
				
			//	New Functions bar
				draw_rectangle_color(226,8,378,56,c_gray,c_gray,c_dkgrey,c_dkgrey,false)
				draw_rectangle_color(226,8,378,56,c_silver,c_silver,c_silver,c_silver,true)
				
			//	New Functions bar
				draw_rectangle_color(386,8,580,56,c_gray,c_gray,c_dkgrey,c_dkgrey,false)
				draw_rectangle_color(386,8,580,56,c_silver,c_silver,c_silver,c_silver,true)					
				
			//	New Functions bar
				draw_rectangle_color(386,8,580,56,c_gray,c_gray,c_dkgrey,c_dkgrey,false)
				draw_rectangle_color(386,8,580,56,c_silver,c_silver,c_silver,c_silver,true)	
				
			// Draw Room Add/Remove
				draw_rectangle_color(793,8,1024,56,c_gray,c_gray,c_dkgrey,c_dkgrey,false)
				draw_rectangle_color(793,8,1024,56,c_silver,c_silver,c_silver,c_silver,true)
			
			// Button Select				
				draw_btn(588,12,40,"backroom")
				draw_btn(736,12,40,"nextroom")
				
			// Test Btn
				draw_btn(284,12,40,"testroom")
			
			// Room Counter
				draw_text_advanced(gW/2,16,string(global.currentLevel+1) +" / "+string(global.maxRooms+1),fnt_sys_32_bold,1,c_white,true,fa_middle,noone)
				
			// Buttons Add room
				draw_btn(800,12,40,"addroom")
				draw_btn(848,12,40,"delroom")	

			#region // Tile Menu bar			
				var _x   = 8;
				var _gap = 8;
			
				draw_btn_menu(_x,_gap + 64 ,40,Snow			,0)
				draw_btn_menu(_x,_gap + 116,40,Ice			,1)
				draw_btn_menu(_x,_gap + 168,40,Background	,2)
				draw_btn_menu(_x,_gap + 220,40,Visuals		,3)
				draw_btn_menu(_x,_gap + 272,40,Entitys		,4)
				draw_btn_menu(_x,_gap + 324,40,Collectables ,5)
				draw_btn_menu(_x,_gap + 376,40,Collectables2,6)
				draw_btn_menu(_x,_gap + 428,40,Obj16x16		,7)
				draw_btn_menu(_x,_gap + 480,40,Spikes		,8)
				draw_btn_menu(_x,_gap + 532,40,Player		,9)
			
			// Draw Btn color
				draw_btn_color(_x,584,40,BgColor,10)
			
			#endregion			
			#region // Coordinates
	
			// Coordinates
				draw_info(24,gH-48, "X :",px,fnt_sys_10,1,c_white,true,16)
				draw_info(24,gH-32, "Y :",py,fnt_sys_10,1,c_white,true,16)
				
			#endregion
	
			
	break; #endregion
	case SCR_CUSTOMMAP: #region // Draw CustomMaps
	
	var xx,yy,width,height,col, _sel;
	
	// Rect Coordinates
		xx  = 283;
		yy  = 84;
	// Rect Size
		width  = 800
		height = 600
	// Rect Color
		col = c_blue;
	
	// Main Rectangle
		draw_rectangle_color(xx,yy,xx + width,yy + height,col,col,col,col,true)
		draw_set_font(fnt_pico8_24)
		draw_text(347,24,"Celeste Custom Levels")
	
	// List Files
		var j = 0;
		var fileName = file_find_first(working_directory + "*.map",fa_directory);
	
		var _json = import_json(fileName, json_parse)
	
	// Update Map Data
		_MapFile = _json;
	
	while(fileName != "") 
	{
		// Fill Files in Array
			array_set(_files,j,fileName)	

		if (cursor_id = j) 
		{			

			// File Structure
				_mapCount   = array_length(_MapFile._roomData)-1
				_mapData	= _MapFile._roomData[_mapCurr].mapData
				_mapHeight  = _MapFile._roomData[_mapCurr].mapHeight / TILESIZE
				BackColor	= _MapFile._roomData[_mapCurr].bkgColor
				CloudColor	= _MapFile._roomData[_mapCurr].cldColor	
		}
		
		fileName = file_find_next();
		j += 1;
		
	}

	if (array_length(_files) <= 0)
		draw_text_advanced(299,364,"No Custom Maps Avaliable",fnt_pico8_24,1,0x550000,false,fa_left,fa_middle)
	else {
	
	//Draw MenuScrolled
		var i=0; 
		var ii=0
		var _space = 150;

		for(i = page_down; i < (amount + page_down); i++) //<<< i=0, when i is less than upgrade, i will increase by 1. 
		{

			if ((cursor_id!=_max_) || i>_max_) && (reset==false)
			{
				// color
					col  = (cursor_id = i ?  c_white  : c_blue);
					_sel = (cursor_id = i ?  c_dkgray : c_black);
				
				// Pos
					xx = 287;
					yy =  88 + ((ii)*_space)
					
				// Draw Menu Rectangle Selected
					draw_rectangle_color(xx,yy,xx + width,yy + height,_sel,_sel,_sel,_sel,false)					
		
				// Menu Size
					width  = 792;
					height = 144;
				
				// Draw Menu Counter
					draw_set_font(fnt_pico8_12)
					var str = string_format(i,4,0);
					str = string_replace_all(str," ","0");
					draw_text(xx+720,yy+8,string(str))

				// Draw Menu data
					draw_set_font(fnt_sys_16)
					draw_text(xx+173,yy+29,string(_files[i]))
					draw_text(xx+173,yy+83,"Room Count:"+string(_mapCount+1))
				
				// Draw Menu Rectangle
					draw_rectangle_color(xx,yy,xx + width,yy + height,col,col,col,col,true)
					
					ii++;							
			}
		}		
	}
	break; #endregion 
	case SCR_TEST_ROOM:  #region // TEST ROOM
	
		draw_text(gW,gH,"TEST ROOM")
	
	break; #endregion	
}
