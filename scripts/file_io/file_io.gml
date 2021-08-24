function string_split(str, dl, array)
{
	var d_at = string_pos(dl, str);
	var count = 0;
	if d_at=0
    {
		return array;
	}
	else
	{
		while(d_at > 0)
		{
			var part		= string_delete(str, d_at, string_length(str));
			str				= string_delete(str, 1, d_at);
			d_at			= string_pos(dl, str);
			array[count]	= real(part);
			count++;
			
			if(d_at == 0 && str != "")
			{//last string without delimiter, need to add too
			    array[count] = real(str);
			}
		}
	}
	return array;
}

function open_level(filename) {

		var json = import_json(filename, json_parse)
		
		// Update Map Data
			_MapFile = json;
			
		var _len = array_length(_MapFile._roomData)-1;	

		// Reload Total Rooms
			global.maxRooms = _len;
			global.currentLevel = 0;		
		
		// Update Map Color
			BackColor  = _MapFile._roomData[global.currentLevel].bkgColor;
			CloudColor = _MapFile._roomData[global.currentLevel].cldColor;
		
		// Reload Tiles
			reload_tiles() 
}

function save_level(current_file,showdlg) {

	if (showdlg)
		show_message("Saved "+string(current_file+string(".map")))
	
	// Jsonify room to file
	jsonify_to_buffer(current_file, _MapFile)

}


function reload_tiles() {

	with(oBlock) {
		instance_destroy();
	}
	
	var _Height = _MapFile._roomData[global.currentLevel].mapHeight/TILESIZE;
	var _Width =  _MapFile._roomData[global.currentLevel].mapWidth/TILESIZE;	
		
	for (var w = 0; w < _Height; w++)
	{
		for(var h = 0; h < _Width; h++)
		{
			
			tile = _MapFile._roomData[global.currentLevel].mapData[w + h * (_Height)];
			var xx = w * TILESIZE;
			var yy = h * TILESIZE;

			switch(tile)
			{
				#region // Spawn Player
					case 1:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=1;
					break;
				#endregion
				#region // Snow Blocks
					case 32:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=32;
					break;

					case 33:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=33;
					break;

					case 34:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=34;
					break;

					case 35:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=35;
					break;
					
					case 36:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=36;
					break;

					case 37:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=37;
					break;

					case 38:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=38;
					break;

					case 39:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=39;
					break;

					case 48:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=48;
					break;

					case 49:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=49;
					break;

					case 50:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=50;
					break;

					case 51:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=51;
					break;

					case 52:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=52;
					break;

					case 53:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=53;
					break;

					case 54:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=54;
					break;

					case 55:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=55;
					break;

					case 72:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=72;
					break;
			#endregion
				#region // Ice
					case 66:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=66;
					break;

					case 67:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=67;
					break;

					case 68:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=68;
					break;

					case 69:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=69;
					break;
					
					case 82:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=82;
					break;

					case 83:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=83;
					break;

					case 84:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=84;
					break;

					case 85:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=85;
					break;

					case 98:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=98;
					break;

					case 99:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=99;
					break;

					case 100:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=100;
					break;

					case 101:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=101;
					break;

					case 114:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=114;
					break;

					case 115:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=115;
					break;

					case 116:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=116;
					break;

					case 117:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=117;
					break;
				#endregion
				#region // Background
					case 16:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=16;
					break;

					case 40:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=40;
					break;

					case 41:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=41;
					break;

					case 42:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=42;
					break;
					case 56:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=56;
					break;

					case 57:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=57;
					break;

					case 58:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=58;
					break;

					case 88:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=88;
					break;

					case 103:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=103;
					break;

					case 104:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=104;
					break;
				#endregion
				#region // Scenary visuals
					case 60:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=61;
					break;

					case 61:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=61;
					break;

					case 62:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=62;
					break;

					case 63:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=63;
					break;
				#endregion
				#region // Spikes
					case 17:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=17;
					break;

					case 27:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=27;
					break;

					case 43:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=43;
					break;

					case 59:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=59;
					break;
				#endregion
				#region // 16x16 Objects (Please Fix other parts from objects)
					case 80:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=80;
					break;

					case 112:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=112;
					break;

					case 86:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=86;
					break;
				#endregion
				#region // Entitys
					case 18:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=18;
					break;

					case 22:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=22;
					break;

					case 23:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=23;
					break;
				#endregion
				#region // Collectables
					case 8:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=8;
					break;

					case 20:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=20;
					break;

					case 26:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=26;
					break;

					case 28:
					a=instance_create_layer(xx, yy, LAYER_OBJECTS, oBlock);
					a.blockID=28;
					break;
				#endregion
	
			}
		}
	}
}
	
function _roomselect(_word) {

	if (_word == "next")  && (global.currentLevel < global.maxRooms)	
	{
		// Next Room
			global.currentLevel++;
			
		// Update Map Color
			BackColor  = _MapFile._roomData[global.currentLevel].bkgColor;
			CloudColor = _MapFile._roomData[global.currentLevel].cldColor;
		
		// Reload Room Tiles
			reload_tiles()
	}
	else if (_word == "back") && (global.currentLevel > 0)
	{
		// Back Room
			global.currentLevel--;
			
		// Update Map Color
			BackColor  = _MapFile._roomData[global.currentLevel].bkgColor;
			CloudColor = _MapFile._roomData[global.currentLevel].cldColor;
		
		// Reload Room Tiles
			reload_tiles()
	}
}

function _addRoom() {
	
	var _len = array_length(_MapFile._roomData);
	
	if  (global.maxRooms < ROOM_LIMIT) 
	{
		global.maxRooms +=1;
		
		_MapFile._roomData[_len] = 
		{
			mapMessage : _Message,
			mapWidth   : Grid.W,
			mapHeight  : Grid.H,
			bkgColor   : BackColor,
			cldColor   : CloudColor,
			mapData    : array_create(mapW*mapH,0)
		}
	}
}

function _delRoom() {
	
	var _len = array_length(_MapFile._roomData);

	if  (global.maxRooms > 0) 
	{
		global.maxRooms--
		
		if (global.currentLevel >= global.maxRooms)
			global.currentLevel = global.maxRooms
		
		array_resize(_MapFile._roomData,_len-1);
		reload_tiles()
	}
	
	//log("SIZE"+string(_len))
}


function clear_room() {
	
	var m_Width  = _MapFile._roomData[global.currentLevel].mapHeight/TILESIZE;
	var m_Height = _MapFile._roomData[global.currentLevel].mapWidth/TILESIZE;
	
	_MapFile._roomData[global.currentLevel].mapData = array_create(m_Width*m_Height,0);
	
	with(oBlock) {
		instance_destroy(self);
	}
}

function reset_editor() {
	
	// Reset Editor
		global.currentLevel = 0;
		global.maxRooms	  = global.currentLevel;
		
	// Restore Editor Default Color
		BackColor  = $000000;

	// Restore Struct
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
		
	// Clear Any Blocks	
		with(oBlock) {
			instance_destroy(self);
		}		
}


function import_json(_file_name, _func) {
	if (file_exists(_file_name)) {
		var _file, _json_string;
		_file = file_text_open_read(_file_name);
		_json_string = "";
		while (!file_text_eof(_file)) {
			_json_string += file_text_read_string(_file);
			file_text_readln(_file);
		}
		file_text_close(_file);
		return script_execute(_func, _json_string);
	}
	return undefined;
}

function jsonify_to_buffer(_file, _data) {
    var _string = json_stringify(_data);
    var _buff = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
    buffer_write(_buff, buffer_string, _string);
    buffer_save(_buff, _file+string(".map"));
    buffer_delete(_buff);
}

