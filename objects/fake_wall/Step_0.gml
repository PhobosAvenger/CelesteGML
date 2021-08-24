move(spd.x, spd.y);
hitbox = new Rectangle(-1, -1, 18, 18);

var hit = collide(oPlayer, 0, 0);

if (hit != noone && hit.dash_effect_time > 0){
	hit.spd.x = -sign(hit.spd.x) * 1.5;
	hit.spd.y = -1.5;
	hit.dash_time = -1;

	destroy_object(self);
	init_object( smoke, x, y);
	init_object( smoke, x + 8, y);
	init_object( smoke, x, y + 8);
	init_object( smoke, x + 8, y + 8);
	init_object( fruit, x + 4, y + 4);
}

hitbox = new Rectangle(0, 0, 16, 16);
