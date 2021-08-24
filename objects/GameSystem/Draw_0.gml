// Reset all palette values
// start game flash
if (start_game)
{
    var c = 10;
    if (start_game_flash > 10)
    {
        if (frames % 10 < 5)
            c = 7;
			paletteSwap = E.colors[c];
    }
    else if (start_game_flash > 5)
        c = 2;
    else if (start_game_flash > 0)
        c = 1;
    else
        c = 0;

    if (c < 10)
    {
        pal(6,c);
        pal(12,c);
        pal(13,c);
        pal(5,c);
        pal(1,c);
        pal(7,c);
    }
}

// clear screen
var bg_col = 0;
if (flash_bg)
    bg_col = frames / 5;
else if (new_bg)
    bg_col = 2;
else if (customMap)
	bg_col = G._MapFile._roomData[G._mapCurr].bkgColor;
rectfill(0, 0, 128, 128, bg_col);


if (level_index() != 31) {
	// Clouds Background
	for (var i = 0; i <= 16; i++) {
		var c = clouds[i];
		c.x += c.spd;
		rectfill(c.x, c.y, c.x + c.w, c.y + 4 + (1 - c.w / 64) * 12, (customMap ? G._MapFile._roomData[G._mapCurr].cldColor : (new_bg ? 14 : 1)), c.alpha);
		if (c.x > room_width)
		{
		    c.x = -c.w;
		    c.y = rnd(room_height - 8);
		}
	}
}

map(e_room.x * 16, e_room.y * 16, 0, 0, 16, 16, 2); // Background [2]
map(e_room.x * 16, e_room.y * 16, 0, 0, 16, 16, 1); // Solids     [1]
map(e_room.x * 16, e_room.y * 16, 0, 0, 16, 16, 3); // Entitys    [3]


// C# Change: "press button X or C" instead to fit consoles
// no need for credits here
if (is_title())
{
    print("press X or C", 44, 80, 5);
    print("matt thorson",44, 96, 5);
    print("noel berry", 46, 102, 5);
}