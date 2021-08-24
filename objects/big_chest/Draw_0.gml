if (state == 0)
{
    var hit = collide(oPlayer, 0, 8);
    if (hit !=noone && hit.is_solid(0, 1))
    {
        E.pause_player = true;
        hit.spd.x = 0;
        hit.spd.y = 0;
        state = 1;
        init_object(smoke, x, y);
        init_object(smoke, x + 8, y);
        timer = 60;
        particles = new particle();
    }
    E.spr(96, x, y);
    E.spr(97, x + 8, y);
}
else if (state == 1)
{
    timer--;
    E.shake = 5;
    E.flash_bg = true;
    if (timer <= 45 && array_length(particles) < 50)
    {
        particles[count] = new particle(
		1 + rnd(14),
		0,
		32 + rnd(32),
		8 + rnd(8)
	    );
		count++;
    }
    if (timer < 0)
    {
        state = 2;
        particles = [];
        E.flash_bg = false;
        E.new_bg = true;
        init_object(orb, x + 4, y + 4);
        E.pause_player = false;
    }
    for (var i = 0; i < array_length(particles); i++)
    {
		var p = particles[i];
        p.y += p.spd;
        rectfill(x + p.x, y + 8 - p.y, x + p.x, min(y + 8 - p.y + p.h, y + 8), 7);
    }
}

E.spr(112, x, y + 8);
E.spr(113, x + 8, y + 8);
