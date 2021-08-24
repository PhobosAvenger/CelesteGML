
function fget(tile, mask) {
	return tile < array_length(E.mask) && (E.mask[tile] & (1 << mask)) != 0;
}

function mget(tx, ty) {
	var tile = E.tilemap[tx + ty * E.sizeHeight];
	return tile;
}

function map(mx, my, tx, ty, mw, mh) {
	var mask = (argument_count > 6) ? argument[6] : 0;
	for (var w = 0; w < mw; w++) {
		for (var h = 0; h < mh; h++) {
			var tile = E.tilemap[w + mx + (h + my) * E.sizeHeight];
			if (tile < array_length(E.sprites) -1) {
				if (fget(tile, mask)){
					E.spr(tile, tx + w * 8, ty + h * 8)
				}
				continue;
			}
		}
	}
}

function solid_at(x, y, w, h){
	return tile_flag_at(x, y, w, h, 0);
}

function ice_at(x, y, w, h){
	return tile_flag_at(x, y, w, h, 4);
}

function tile_at(x, y) {
	return mget(E.e_room.x * 16 + x, E.e_room.y * 16 + y);
}

function spikes_at(x, y, w, h, xspd, yspd){
    for (var i = max(0, flr(x / 8)); i <= min(15, (x + w - 1) / 8); i++)
        for (var j = max(0, flr(y / 8)); j <= min(15, (y + h - 1) / 8); j++){
            var tile = tile_at(i, j);
			
			
            if (tile == 17 && ((y + h - 1) % 8 >= 6 || y + h == j * 8 + 8) && yspd >= 0)
                return true;
            else if (tile == 27 && y % 8 <= 2 && yspd <= 0)
                return true;
            else if (tile == 43 && x % 8 <= 2 && xspd <= 0)
                return true;
            else if (tile == 59 && ((x + w - 1) % 8 >= 6 || x + w == i * 8 + 8) && xspd >= 0)
                return true;
        }
    return false;
}

function tile_flag_at(x, y, w, h, mask) {
	for (var i = max(0, flr(x / 8)); i <= min(15, (x + w - 1) / 8); i++)
		for (var j = max(0, flr(y / 8)); j <= min(15, (y + h - 1) / 8); j ++)
			if (fget(tile_at(i, j), mask))
				return true;
	return false;
}