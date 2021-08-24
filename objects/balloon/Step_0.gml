move(spd.x, spd.y);
if (spr == 22)
{
    offset += 0.01;
    y = start + Sin(offset) * 2;
    var hit = collide(oPlayer, 0, 0);
    if (hit != noone && hit.djump < E.max_djump)
    {
        init_object(smoke, x, y);
        hit.djump = E.max_djump;
        spr = 0;
        timer = 60;
    }
}
else if (timer > 0)
    timer--;
else
{
    init_object(smoke, x, y);
    spr = 22;
}