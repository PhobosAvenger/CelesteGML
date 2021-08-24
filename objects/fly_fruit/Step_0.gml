move(spd.x, spd.y);
// fly away 
if (fly)
{
    if (sfx_delay > 0)
    {
        sfx_delay--;
    }
    spd.y = appr(spd.y, -3.5, 0.25);
    if (y < -16)
        destroy_object(self);
}
// wait
else
{
    if (E.has_dashed)
        fly = true;
    step += 0.05;
    spd.y = Sin(step) * 0.5;
}
// collect
var hit = collide(oPlayer,0, 0);
if (hit != noone)
{
    hit.djump = E.max_djump;
    //G.sfx_timer = 20;
    //E.sfx(13);
    E.got_fruit[1 + E.level_index()] = true;
    init_object(lifeup, x, y);
    destroy_object(self);
	
	//Stats.Increment(Stat.PICO_BERRIES);
		update_berries();
}