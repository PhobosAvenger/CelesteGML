// Init Particle System

function init_clouds(){
	
	clouds = [];
		
	for (var i = 0; i <= 16; i++)
	{
		clouds[i] = new Cloud(
		rnd(128),
		rnd(128),
		1 + rnd(4),
		32 + rnd(32),
		random_range(0.5,0.9)
		);
	}
}

function init_snow(){
	
	particles = [32];
	
	for (var i = 0; i <= 32; i++)
	{
		particles[i] = new Particle(
		rnd(room_width),
		rnd(room_height),
		0 + flr(rnd(5) / 4),
		0.25 + rnd(5),
		rnd(1),
		6 + flr(0.5 + rnd(1))
		);
	}
}