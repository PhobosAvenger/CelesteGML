/// @description Insert description here
// You can write your code in this editor

var off = 0;
if (!fly)
{
    var dir = Sin(step);
    if (dir < 0)
        off = 1 + max(0, sign(y - start));
}
else
    off = (off + 0.25) % 3;
	
E.spr(45 + off, x - 6, y - 2, 1, 1, true, false);
E.spr(spr, x, y);
E.spr(45 + off, x + 6, y - 2);