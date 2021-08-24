/// @description Insert description here
// You can write your code in this editor

// Snows
for (var i = 0; i <= 32; i++){
	p = particles[i];
	p.x += p.spd;
	p.y += Sin(p.off);
	p.off += min(0.05, p.spd / 32);
	rectfill(p.x, p.y, p.x + p.s, p.y + p.s, p.c);
	if (p.x > room_width + 4)
	{
	    p.x = -4;
	    p.y = rnd(room_height);
	}
}

// dead particles
for (var i = dead_particles.size - 1; i >= 0; i--){
	var p = dead_particles.get(i);
	p.x += p.spd.x;
	p.y += p.spd.y;
	p.t--;
	if (p.t <= 0)
	{
		dead_particles.remove(i);
		continue;
	}
	rectfill(p.x - p.t / 5, p.y - p.t / 5, p.x + p.t / 5, p.y + p.t / 5, 14 + p.t % 2);
}

if (level_index() == 30){
	var p = noone;

    for (var i = 0; i < objects.size; i++)
	{
		var o = E.objects.get(i);
		if(!instance_exists(o)) continue;
	        if (o.kind == oPlayer)
	        {
	            p = o;
	            break;
	        }
	}
	
    if (p != noone)
    {
        var diff = min(24, 40 - abs(p.x + 4 - 64));
        rectfill(-2, 0, diff , 127, 0);			  // Left
        rectfill(128 - diff - 2, 0, 132, 128, 0); // Right
    }
}

// draw outside of the screen for screenshake
rectfill(-96, -5, -1, 133, 0);	// LEFT
rectfill(-5, -5, 133, -2, 0);	// TOP
rectfill(128, -5, 197, 133, 0); // RIGHT
rectfill(-5, 128, 133, 133, 0); // BOTTOM


// Draw Timer and Collected
/*
rectfill(-56, 8, -8, 48, 1);
E.spr(26, -48, 24);
print("x  " + string(score), -32, 26, 7);
E.draw_time(-48, 12);
print("deaths:" + string(E.deaths), -48, 38, 7);
*/