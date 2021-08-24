// Particles

function Cloud(_x, _y, _spd, _w, _a) constructor
{
	x = _x;
	y = _y;
	spd = _spd;
	w = _w;
	alpha = _a;
};

function Particle(_x, _y, _s, _spd, _off, _c) constructor
{
	x = _x;
	y = _y;
	s = _s;
	spd = _spd;
	off = _off;
	c = _c;
};

function DeadParticle(_x, _y, _t, _spd) constructor
{
	x = _x;
	y = _y;
	t = _t;
	spd = _spd;
};