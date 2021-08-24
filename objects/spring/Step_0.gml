move(spd.x, spd.y);
if (hide_for > 0)
{
    hide_for--;
    if (hide_for <= 0)
    {
        spr = 18;
        delay = 0;
    }
}
else if (spr == 18)
{
    var hit = collide(oPlayer, 0, 0);
    if (hit != noone && hit.spd.y >= 0)
    {
        spr = 19;
        hit.y = y - 4;
        hit.spd.x *= 0.2;
        hit.spd.y = -3;
        hit.djump = E.max_djump;
        delay = 10;
        init_object(smoke, x, y);

        // breakable below us
        var below = collide(fall_floor, 0, 1);
        if (below != noone)
            E.break_fall_floor(below);
    }
}
else if (delay > 0)
{
    delay--;
    if (delay <= 0)
        spr = 18;
}

// begin hiding
if (hide_in > 0)
{
    hide_in--;
    if (hide_in <= 0)
    {
        hide_for = 60;
        spr = 0;
    }
}
