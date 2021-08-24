//move(spd.x, spd.y);
if (state == 0)
{
    if (check(oPlayer, 0, -1) || check(oPlayer, -1, 0) || check(oPlayer, 1, 0)){
        E.break_fall_floor(self);
	}
}
else if (state == 1)
{
    delay--;
    if (delay <= 0)
    {
        state = 2;
        delay = 60; //how long it hides for
        collideable = false;
    }
}
else if (state == 2)
{
    delay--;
    if (delay <= 0 && !check(oPlayer, 0, 0))
    {
        state = 0;
        collideable = true;
        init_object(smoke, x, y);
    }
}