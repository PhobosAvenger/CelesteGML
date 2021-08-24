/// @description Insert description here

// Global game vars only
init_gamevars();
// Init camera
camera(-CAMX,CAMY);
// Clouds Particles
init_clouds();
// Snow Particles
init_snow();
// Dead Particles
dead_particles = new Array();

#region // entry point
GameFunctions();

// Pico 8 Colors
colors = [ $000000,$532b1d,$53257e,$518700,$3652ab,$4f575f,$c7c3c2,$e8f1ff,$4d00ff,$00a3ff,$27ecff,$36e400,$ffad29,$9c7683,$a877ff,$aaccff ];
paletteSwap = c_white;

sprites = [(sprite_get_width(atlas) / 8) * (sprite_get_height(atlas) / 8)];

for (var ty = 0; ty < sprite_get_height(atlas) / 8; ty++){
	for (var tx = 0; tx < sprite_get_width(atlas) / 8; tx++)
	{
		sprites[tx + ty * (sprite_get_width(atlas) / 8)] = [tx * 8, ty * 8];
	}
}

function spr(sprite, X, Y) {
	var columns = (argument_count > 3) ? argument[3] : 1,
		rows	= (argument_count > 4) ? argument[4] : 1,
		flipX	= (argument_count > 5) ? (argument[5] ? -1 : 1) : 1,
		flipY	= (argument_count > 6) ? (argument[6] ? -1 : 1) : 1;

	sprite = (sprite > 0) ? sprite : 1;
	
	for (var sx = 0; sx < columns; sx++)
	{
	    for (var sy = 0; sy < rows; sy++)
		{
			var _spr = sprites[sprite + sx + sy * 16];
		
			draw_sprite_part_ext(atlas, 0, _spr[0], _spr[1], 8, 8, floor((flipX ? 0 : 8) + X + sx * 8), floor((flipY ? 0 : 8) + Y + sy * 8), flipX, flipY, paletteSwap, image_alpha)
		}
	}
}

solid_sprites = [(sprite_get_width(s_snow) / 8) * (sprite_get_height(s_snow) / 8)];

for (var ty = 0; ty < sprite_get_height(s_snow) / 8; ty++){
	for (var tx = 0; tx < sprite_get_width(s_snow) / 8; tx++)
	{
		solid_sprites[tx + ty * (sprite_get_width(s_snow) / 8)] = [tx * 8, ty * 8];
	}
}
#endregion
#region // MapData
tilemap = [];
mask	= [ 
			0, 0, 0,  0,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            4, 2, 0,  0,  0,  0,  0, 0, 0, 0, 0, 2, 0, 0, 0, 0,
            3, 3, 3,  3,  3,  3,  3, 3, 4, 4, 4, 2, 2, 0, 0, 0,
            3, 3, 3,  3,  3,  3,  3, 3, 4, 4, 4, 2, 2, 2, 2, 2,
            0, 0, 19, 19, 19, 19, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2,
            0, 0, 19, 19, 19, 19, 2, 2, 4, 2, 2, 2, 2, 2, 2, 2,
            0, 0, 19, 19, 19, 19, 0, 4, 4, 2, 2, 2, 2, 2, 2, 2,
            0, 0, 19, 19, 19, 19, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2
		  ];
		  	  

// Get Map Data
customMap  = System._iscustom;
sizeHeight = System._mapHeight;
tilemap    = System._mapData;

// Layer
Act_Layer  = LAYER_OBJECTS

#endregion

// Start Title Screen
if (customMap)
	begin_game();
else
	title_screen();

