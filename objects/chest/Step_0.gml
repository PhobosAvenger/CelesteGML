move(spd.x, spd.y);

if (E.has_key)
{
    timer--;
    x = start - 1 + rnd(3);
    if (timer <= 0)
    {
        //G.sfx_timer = 20;
        //E.sfx(16);
        init_object(fruit, x, y - 4);
        destroy_object(self);
    }
}