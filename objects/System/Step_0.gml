/// @description Update()

Inputs();

switch(global.currentScreen)
{

	case SCR_MAINMENU:    #region // [0] MAIN MENU
	
	camera_set_view_size(view_camera[0],256,128)
	
	// Set Window Caption
		window_set_caption("Celeste GML :: FPS :"+string(fps) + " :: Instances " + string(instance_count))
	
	// Ease in
		menu_x += (menu_x_target - menu_x) / menu_speed;

	// menu
	if (menu_control)
	{
		if (keyboard_check_pressed(vk_up))
		{
		    menu_cursor++;
		    if (menu_cursor >= menu_items) menu_cursor = 0;
		}
		if (keyboard_check_pressed(vk_down))
		{
		    menu_cursor--;
		    if (menu_cursor < 0) menu_cursor = menu_items-1;
		}
		if (keyboard_check_pressed(vk_enter))
		{
		    menu_x_target = gui_width - 1024;
		    menu_committed = menu_cursor;
			
		    // Shake Screen
				menu_control = false;
		}
	}

	if (menu_x < -512) && (menu_committed != -1)
	{
	    switch(menu_committed)
	    {
			case 3: #region // Play Celeste Classic
			
			// Align Game Camera
				camera_set_view_size(view_camera[0], 256, 128);
				camera_set_view_pos(view_camera[0], -CAMX, CAMY);
			
			// Check if is custom map
				_iscustom = false;
			
			// Change mapData to Default Celeste Maps
				_mapData   = DataMapOri();
				_mapHeight = 16 * TILESIZE;
			
			// Restore Editor Background
				BackColor  = $000000;
				CloudColor = $532b1d;

			// Init Game screen
				instance_create_layer(x,y,layer,GameSystem);
			
			// Set is Game Mode
				global.currentScreen = SCR_GAME_SCREEN;
			
			// Check Menu
				menu_committed = -1 
			
		break; #endregion
		
			case 2: #region // Play Custom Maps

				// Set to Custom Map
					global.currentScreen = SCR_CUSTOMMAP;
				
				// Start Room
					_mapCurr = 0;
					
				// Check menu
					menu_committed = -1;
				
			break; #endregion;	
			
			case 1: #region // Level Editor
			
				// Set is Editor Mode
					global.currentScreen = SCR_EDITOR;
			
				// Get Editor Cam Size and Coordinates 
					camera_set_view_size(view_camera[0], base_width/zoom, base_height/zoom);
					camera_set_view_pos(view_camera[0], camX, camY);
				
				// Restore Editor rooms
					//reset_editor()
				
				// Check Menu
					menu_committed = -1 
			break; #endregion
			
			case 0: #region // Exit Game
				game_end(); 
				break; #endregion
	    }
	}

break; #endregion
	case SCR_EDITOR:      #region // [1] EDITOR
	
	// Set Window Caption
		window_set_caption("Celeste GML EDITOR :: FPS :"+string(fps) + " Instances Tiles "+string(instance_number(oBlock)) + "/" + string(mapW*mapH))
	
	// Debug Overlay
		//show_debug_overlay(true)

		var viewxview = camera_get_view_x(view_camera[0]);
		var viewyview = camera_get_view_y(view_camera[0]);
		var viewWview = camera_get_view_width(view_camera[0])
		var viewHview = camera_get_view_height(view_camera[0])

		//Timer handling
			if (timerText > 0)
			    timerText--;
			else
			    timerText = 0;

		// Focus
		    if (timer_focus > 0)
		        timer_focus--;
	
	#region // [FILE IO] - Open JSON Room
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("O"))) {
	
		var file;
		file = get_open_filename("map file|*.map", "");

		if file != ""
		   {
			room_clear()
			open_level(file)
		   }
	}
	#endregion
	#region // [FILE IO] - Save Room
	if (keyboard_check(vk_control) && !keyboard_check(vk_shift) && keyboard_check_pressed(ord("S"))) {
	
		var file;
		file = get_string("Map Name","Map_") //get_save_filename("map file|*.map", "");
	
		save_level(file, true)
	}
	#endregion
	#region // [EDITOR]  - Clear Room
	if (keyboard_check(vk_shift) && keyboard_check_pressed(vk_delete)) {
	
		show_msg("Room Clear")
		timerText = 5
		room_clear()
	}
	#endregion

	#region // Enable Grid
	if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("G")))
	{
		global.showGrid = !global.showGrid;
	}
	#endregion			
	#region // Place/Get/Remove Tiles
	    // SNAPGRID COORDINATES
	    var xx = mouse_x div TILESIZE;
	    var yy = mouse_y div TILESIZE;

	    xx = xx * TILESIZE;
	    yy = yy * TILESIZE;
	
		px = xx;
		py = yy;

	    if (mouse_check_button(mb_left) && timer_focus == 0 && !keyboard_check(vk_space)) {

	        if main_grid(xx, yy, TILESIZE) {
				
				if (!on_levelgrid(Grid.W,Grid.H))
					return;

	            if (instance_position(xx, yy, oBlock) == noone) {
	                // Create solid
	                a = instance_create_layer(xx , yy , LAYER_OBJECTS, oBlock);
	                a.image_index = global.blockID;			

	                var row = xx / TILESIZE;
	                var col = yy / TILESIZE;
					
					var _Height =_MapFile._roomData[global.currentLevel].mapHeight/TILESIZE;
					
					
					if (global.blockID == 60)		// Arvore
					{
						_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]	   = 60;
						
						if (col != 0)
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)] = 44;
					} else if (global.blockID == 80) // Fake Wall
					{
						_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 80
						_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 81
						if (col != 1)
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 64
							_MapFile._roomData[global.currentLevel].mapData[row+1+(col-1)*(_Height)] = 65
					} else if (global.blockID == 86) // Memorial
					{
						_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 86
						_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 87
						_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 70
						_MapFile._roomData[global.currentLevel].mapData[row+1+(col-1)*(_Height)] = 71
					} else if (global.blockID == 112) // BigChest
					{
						_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 112
						_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 113
						_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 96
						_MapFile._roomData[global.currentLevel].mapData[row+1+(col-1)*(_Height)] = 97
					} else {
						_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)] = global.blockID;
					}
	            }
	        }

	    } else if (mouse_check_button_pressed(mb_middle)) {
	        if (main_grid(xx, yy, TILESIZE) && instance_position(xx, yy, oBlock)) {
	            var obj = instance_position(xx, yy, oBlock);
	            global.blockID = obj.blockID;
	        }
	    } else if (mouse_check_button(mb_right) && timer_focus == 0 && !keyboard_check(vk_space))

	    {
	        if main_grid(xx, yy, TILESIZE) {
	            var obj = instance_position(xx, yy, oBlock);
	            if obj != noone {
	                with(obj) {
	                    instance_destroy();
	                }

	                var row = xx / TILESIZE;
	                var col = yy / TILESIZE;
					
					var _Height =_MapFile._roomData[global.currentLevel].mapHeight/TILESIZE;
					var _Tile = _MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]
					
					switch(_Tile)
					{
						#region // TREE
						case 60:
								_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]	   = 0;
								if (col != 0)
									_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)] = 0;
						break;
						case 44:
								_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]	   = 0;
								_MapFile._roomData[global.currentLevel].mapData[row+(col+1)*(_Height)] = 0;
						break;
						#endregion
						#region // Fake Wall
						case 64:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col+1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+(col+1)*(_Height)] = 0
						break;
						case 65:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col+1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+(col+1)*(_Height)] = 0
						break;
						case 80:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+(col-1)*(_Height)] = 0
						break;
						case 81:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+(col-1)*(_Height)] = 0
						break;
						#endregion
						#region // Memorial
						case 70:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col+1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+(col+1)*(_Height)] = 0
						break;
						case 71:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col+1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+(col+1)*(_Height)] = 0
						break;
						case 86:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+(col-1)*(_Height)] = 0
						break;
						case 87:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+(col-1)*(_Height)] = 0
						break;
						#endregion
						#region // BigChest
						case 96:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col+1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+(col+1)*(_Height)] = 0
						break;
						case 97:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col+1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+(col+1)*(_Height)] = 0
						break;
						case 112:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row+1+(col-1)*(_Height)] = 0
						break;
						case 113:
							_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)]       = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+col*(_Height)]     = 0
							_MapFile._roomData[global.currentLevel].mapData[row+(col-1)*(_Height)]   = 0
							_MapFile._roomData[global.currentLevel].mapData[row-1+(col-1)*(_Height)] = 0
						break;
						#endregion

						
						default:
								_MapFile._roomData[global.currentLevel].mapData[row+col*(_Height)] = 0;
						break;
					}

	            }
	        }
	    }
#endregion
	#region // Room Screen - Camera movement

	if (keyboard_check_pressed(vk_end)) {
	    camX = -116;
	    camY = -74;
	    show_msg("Fit Screen")

	    // Register INI CAM POSITION
	    ini_open("Config/Settings.ini");
	    ini_write_real("Camera", "X", camX);
	    ini_write_real("Camera", "Y", camY);
	    ini_close();
	}

	if (keyboard_check(vk_space) or mouse_check_button(mb_middle)) {
	    show_msg("Drag Camera")
	    timerText = 5
	
		//var cam_x, cam_y;

	    if (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_middle)) {
	        drag_x = mouse_x
	        drag_y = mouse_y
	    }
	    // update:
	    if (mouse_check_button(mb_left) or mouse_check_button(mb_middle)) {
	        // actual dragging logic:
	        viewxview = drag_x - (mouse_x - viewxview)
	        viewyview = drag_y - (mouse_y - viewyview)

	        camX = viewxview;
	        camY = viewyview;

	        camera_set_view_pos(view_camera[0], camX, camY)

	        // make sure view doesn't go outside the room: (OFF)
	        camX = max(-4096, min(camX, 4096 + base_width - viewWview))
	        camY = max(-4096, min(camY, 4096 + base_height - viewHview))		
	    }

	}
	#endregion
	#region // Room Screen - Camera zoom
	if (mouse_wheel_up() && (zoom < zoom_in) && keyboard_check(vk_control)) {
	    zoom += zoom_rate;
	    editor_zoom_update(base_width, base_height, mouse_x, mouse_y, viewxview, viewyview, viewWview, viewHview)
	    show_msg("Zoom in" + string(zoom))

	    // Register INI CAM POSITION
	    ini_open("Config/Settings.ini");
	    ini_write_real("Camera", "zoom", zoom);
	    ini_close();

	}
	if (mouse_wheel_down() && (zoom > zoom_out) && keyboard_check(vk_control)) {
	    zoom -= zoom_rate;
	    editor_zoom_update(base_width, base_height, mouse_x, mouse_y, viewxview, viewyview, viewWview, viewHview)
	    show_msg("Zoom out" + string(zoom))

	    // Register INI CAM POSITION
	    ini_open("Config/Settings.ini");
	    ini_write_real("Camera", "zoom", zoom);
	    ini_close();
	}
	#endregion
	
	// CAMERA RESET
	camera_set_view_size(view_camera[0], base_width/zoom, base_height/zoom);
	camera_set_view_pos(view_camera[0], camX, camY);
	
break; #endregion
	case SCR_CUSTOMMAP:   #region // [2] CUSTOM MAP
	
	// Set Window Caption
		window_set_caption("Celeste GML EDITOR :: CURSOR :"+string(cursor_id))	

	// menu
		key_up    = keyboard_check_pressed(vk_up);
		key_down  = keyboard_check_pressed(vk_down);
	
	// Set current cursor position
		cursor_id=cursor+cursor_pos

		var len = array_length(_files);
		amount  = min(len,display);
		_max_   = min(len,len);

		if (key_up && cursor_id !=0)
			if (cursor !=0) {cursor--;} else {page_down--; cursor_pos--};
	
		if (key_down && cursor_id != (_max_-1))
			if (cursor < (amount-1)) {cursor++;} else {page_down++; cursor_pos++};

	
		if (keyboard_check_pressed(vk_enter) && array_length(_files) > 0)
		{
			committed_item = cursor_id;
	
		    if (committed_item == cursor_id)
		    {
					// Align Game Camera
						camera_set_view_size(view_camera[0], 256, 128);
						camera_set_view_pos(view_camera[0], -CAMX, CAMY);
					
					// check is custom
						_iscustom = true;
				
					// Create Game Instance
						instance_create_layer(x,y,layer,GameSystem);
				
					// Set is Editor Mode
						global.currentScreen = SCR_GAME_SCREEN;				
				
					committed_item = -1;
		    }
		}

	
	break; #endregion
	case SCR_GAME_SCREEN: #region // [3] GAME
	
	// Debug Overlay
		//show_debug_overlay(true)
	
	// Set Window Caption
		window_set_caption("Celeste GML :: FPS :"+string(fps) + " :: " + string(E.Area_current) + " :: Instances " + string(instance_count))

	break; #endregion
	
	case SCR_TEST_ROOM: #region // [4] TEST ROOM
		
	// Set Window Caption
		//window_set_caption("Celeste GML :: FPS :"+string(fps) + " :: " + string(E.Area_current) + " :: Instances " + string(instance_count))

	break; #endregion
}