event_inherited() //move(spd.x, spd.y);

// jumping up
if (state == 0)
{
    if (y < target.y + 16)
    {
        state = 1;
        delay = 3;
    }	
}
// falling
else if (state == 1)
{
    spd.y += 0.5;
    if (spd.y > 0 && delay > 0)
    {
        spd.y = 0;
        delay--;
    }     
    if (spd.y > 0 && y > target.y)
    {
		y = target.y;
        spd = new Vector2(0, 0);
		state = 2;
        delay = 5;
        E.shake = 5;
        init_object(smoke, x, y + 4);
    }
}
// landing
else if (state == 2)
{
	delay--;
    spr = 6;
	if (delay < 0)
    {
		destroy_object(self);
		E.Act_Layer = LAYER_PLAYER;
		init_object(oPlayer, x, y);
	}
}
