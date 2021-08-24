move(spd.x, spd.y);

var was = flr(spr);
spr = 9 + (Sin(E.frames / 30.0) + 0.5) * 1;
var current = flr(spr);
if (current == 10 && current != was)
    flipX = (flipX ? -1 : 1);
if (check(oPlayer, 0, 0))
{
    destroy_object(self);
    E.has_key = true;
}