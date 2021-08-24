/// @description 

// Set game speed
game_set_speed(30, gamespeed_fps)

// main Globals
global.currentScreen = SCR_MAINMENU;

// Editor gLobals
global.showGrid   = true;
global.showCellID = false;
global.cellID     = false;

// Main Menu

#region // GUI
gui_width  = 0;
gui_height = 720;
gui_margin = 64;
#endregion
#region // Menu
menu_x = gui_width - 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width + gui_margin;
menu_speed = 10; // lower is faster
menu_font = fnt_pico8_24;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;
#endregion
#region // Menu Options
menu[3] = "Celeste Classic";
menu[2] = "Play Custom Levels";
menu[1] = "Level Editor";
menu[0] = "Quit";
#endregion
#region // Selected
menu_items = array_length(menu);
menu_cursor = 3;
#endregion

// Snow Particles
init_snow();
colors = [ $000000,$532b1d,$53257e,$518700,$3652ab,$4f575f,$c7c3c2,$e8f1ff,$4d00ff,$00a3ff,$27ecff,$36e400,$ffad29,$9c7683,$a877ff,$aaccff ];

// File list
_files = [];

// Custom Level Select
amount  = 0;
display = 4;
reset   = false;

cursor=0;
cursor_pos=0;
cursor_id=0;
page_down=0;

committed_item = -1;

// Editor
#region // Camera Settings

ini_open("Config/Settings.ini");

// Editor Camera Settings
drag_x = mouse_x;
drag_y = mouse_y;

// Editor Camera Zoom
base_width  = 480;
base_height = 270;

// Camera Current View
camX = ini_read_real("Camera", "X", 0);
camY = ini_read_real("Camera", "Y", 0);

// Zoom Settings
zoom = ini_read_real("Camera", "zoom", 2);
zoom_rate = 0.2;
zoom_in   = 2;
zoom_out  = 1.5;

ini_close();

#endregion
#region // UI Display Message
timerTextReset = 1 * room_speed;
timerText = 0;
current_text = "";

// Editor focus
timer_focus = 0;
#endregion

#region // Level Editor Settings

// Global Map
global.currentLevel = 0;
global.maxRooms = global.currentLevel;

// Current Cursor
global.blockID = 1;

// Grid Settings
mapH = 16;
mapW = 16;
Grid = new Vec2(mapW*TILESIZE,mapH*TILESIZE);

// map Author
_Author  = "Phobos";
_Message = "Test Message!!";

// Background and Cloud Color
BackColor  = $000000;
CloudColor = $532b1d;

// Cursor position
px = 0;
py = 0;

#endregion
#region // Editor Tools

// Blocks ID
Snow	      = [32,33,34,35,36,37,38,39,48,49,50,51,52,53,54,55,72]
Ice		      = [66,67,68,69,82,83,84,85,98,99,100,101,114,115,116,117]
Background    = [16,40,41,42,56,57,58,88,103,104]
Visuals	      = [60,61,62,63] // 66 + 44 = arvore
Spikes		  = [17,27,43,59] 
Obj16x16	  = [80,112,86] //
Entitys       = [23,22,18]
Collectables  = [26,28]
Collectables2 = [20,8]
Player		  = [1]

// BG Color
BgColor = [
[ $000000 , $532b1d ],
[ $532b1d , $53257e ],
[ $9c7683 , $e8f1ff ],
[ $9c7683 , $aaccff ],
[ $000000 , $53257e ],
[ $a877ff , $aaccff ]]

// Menu Checks
menu_opened    = [0,0,0,0,0,0,0,0,0,0,0] // TRUE OR FALSE
item_selected  = [
	Snow[0],
	Ice[0],	      
	Background[0],
	Visuals[0],
	Entitys[0],	
	Collectables[0],  
	Collectables2[0], 
	Obj16x16[0],
	Spikes[0],
	Player[0],
	BgColor[0]
]
#endregion
#region // ICONS
sprites = [(sprite_get_width(atlas) / 8) * (sprite_get_height(atlas) / 8)];

for (var ty = 0; ty < sprite_get_height(atlas) / 8; ty++){
	for (var tx = 0; tx < sprite_get_width(atlas) / 8; tx++)
	{
		sprites[tx + ty * (sprite_get_width(atlas) / 8)] = [tx * 8, ty * 8];
	}
}
#endregion

// File Structure

_MapFile = 	{ 
	_mapAuthor  : _Author,
	_roomData :  [{
		mapMessage : _Message,
		mapWidth   : Grid.W,
		mapHeight  : Grid.H,
		bkgColor   : BackColor,
		cldColor   : CloudColor,
		mapData    : array_create(mapW*mapH,0)
	}]
}

// Current game Mapdata
_mapCurr   = 0;
_mapData   = _MapFile._roomData[_mapCurr].mapData;
_mapHeight = _MapFile._roomData[_mapCurr].mapHeight;
_mapCount  = array_length(_MapFile._roomData)

_iscustom = false;