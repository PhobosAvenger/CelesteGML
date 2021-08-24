function init_spr_solid(sprite, X, Y) {
	var index, up, right, left, down, size;

	size = TILESIZE;

	// Directional check
	up = place_meeting(X, Y - size, object_index);
	right = place_meeting(X - size, Y, object_index);
	left = place_meeting(X + size, Y, object_index);
	down = place_meeting(X, Y + size, object_index);

	if (up && right && left && down)
	{
		index = 61;
	}
	else
	{
		if (up && right && left && not down)
			index = 29;
		else if (up && right && not left && down)
			index = 45;
		else if (up && not right && left && down)
			index = 53;
		else if (not up && right && left && down)
			index = 57;
		else if (not up && not right && left && down)
			index = 49;
		else if (not up && right && not left && down)
			index = 41;
		else if (not up && right && left && not down)
			index = 25;
		else if (not up && not right && not left && down)
			index = 33;
		else if (not up && not right && left && not down)
			index = 17;
		else if (not up && right && not left && not down)
			index = 9;
		else if (up && not right && not left && down)
			index = 37;
		else if (up && not right && left && not down)
			index = 21;
		else if (up && not right && not left && not down)
			index = 5;
		else if (up && right && not left && not down)
			index = 13;
		else if (not up && not right && not left && not down)
			index = 0;
		else
			index = 0;
	}

	var _spr = E.solid_sprites[index + random_tile];
	draw_sprite_part_ext(sprite, 0, _spr[0], _spr[1], 8, 8, floor(X), floor(Y), image_xscale, image_yscale, image_blend, image_alpha)
}
