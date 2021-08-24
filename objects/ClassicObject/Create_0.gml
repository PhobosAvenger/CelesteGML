kind = noone;
collideable = true;
solids = true;
flipX = false;
flipY = false;
spr = 0;
hitbox = new Rectangle(0, 0, 8, 8);
spd = new Vector2(0, 0);
rem = new Vector2(0, 0);

function move(ox, oy) {
	amount = 0;
	// [x] get move amount
	rem.x += ox;
	amount = flr(rem.x + 0.5)
	rem.x -= amount;
	move_x(amount, 0);

	// [y] get move amount
	rem.y += oy;
	amount = flr(rem.y + 0.5)
	rem.y -= amount;
	move_y(amount);
}

function is_solid(ox, oy) {
	if (oy > 0 and not check(platform, ox, 0) and check(platform, ox, oy))
		return true;

	return solid_at(x + hitbox.x + ox, y + hitbox.y + oy, hitbox.Width, hitbox.Height) ||
	check(fall_floor, ox, oy) ||
	check(fake_wall, ox, oy);

}

function is_ice(ox, oy){
	return ice_at(x + hitbox.x + ox, y + hitbox.y + oy, hitbox.Width, hitbox.Height);
}
	
function collide(type, ox, oy){
	var outro = noone;
	for (var i = 0; i < E.objects.size; i++)
	{
		outro = E.objects.get(i);
		if (!instance_exists(outro)) continue;
		if (outro != noone && outro.kind == type && outro != self && outro.collideable &&
			outro.x + outro.hitbox.x + outro.hitbox.Width > x + hitbox.x + ox &&
			outro.y + outro.hitbox.y + outro.hitbox.Height > y + hitbox.y + oy &&
			outro.x + outro.hitbox.x < x + hitbox.x + hitbox.Width + ox &&
			outro.y + outro.hitbox.y < y + hitbox.y + hitbox.Height + oy ){
			return outro
		}
	}
	return noone
}

function check(obj, ox, oy) {
	var hit = collide(obj, ox, oy);
	if (hit != noone)
		return true;
	else
		return false
}

function move_x(amount, start) {
	if (solids)
	{
		var step = sign(amount);
		for (var i = start; i <= abs(amount); i++)
			if (!is_solid(step, 0))
				x += step;
			else
			{
				spd.x = 0;
				rem.x = 0;
				break;
			}
	}
	else
		x += amount;
}

function move_y(amount) {
	if (solids)
	{
		var step = sign(amount);
		for (var i = 0; i <= abs(amount); i++)
			if (!is_solid(0, step))
				y += step;
			else
			{
				spd.y = 0;
				rem.y = 0;
				break;
			}
	}
	else
		y += amount;
}