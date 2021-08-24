move(spd.x, spd.y);
var hit = collide(oPlayer, 0, 0);
if (hit != noone)
{
    hit.djump = E.max_djump;
    E.got_fruit[1 + E.level_index()] = true;
    init_object(lifeup, x, y);
    destroy_object(self);
	
	//Stats.Increment(Stat.PICO_BERRIES);
		update_berries();
    
}
off++;
y = start + Sin(off / 40) * 2.5;