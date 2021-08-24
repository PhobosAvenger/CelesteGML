/// @desc draw_player(Object obj, int djump);
/// @arg obj
/// @arg djump
function draw_player(obj, djump) {
	var spritePush = 0;
	if (djump == 2)
	{
	    if (flr((E.frames / 3) % 2) == 0)
	        spritePush = 10 * 16;
		else
	        spritePush = 9 * 16;
		
	}
	else if (djump == 0)
	{
	    spritePush = 8 * 16;
	}
	E.spr(obj.spr + spritePush, obj.x, obj.y, 1, 1, obj.flipX, obj.flipY);

}
