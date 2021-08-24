move(spd.x, spd.y);

spd.x = dir * 0.65;
if (x < -16) x = 128;
if (x > 128) x = -16;
if (!check(oPlayer, 0, 0))
{
    var hit = collide(oPlayer, 0, -1);
    if (hit != noone)
        hit.move_x((x - last), 1);
}
last = x;