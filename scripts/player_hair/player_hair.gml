
function create_hair(obj){
	
	hair = [5];
	
	for (var i = 0; i <= 4; i++)
		hair[i] = new node(obj.x, obj.y, max(1, min(2, 3 - i)));
}

function draw_hair(obj, facing, djump)
{
    c = (djump == 1 ? 8 : (djump == 2 ? (7 + flr((E.frames / 3) % 2) * 4) : 12));
    last = new Vector2(obj.x + 4 - facing * 2, obj.y + (obj.down_key ? 4 : 3));
	
	for (var i = 0; i < array_length(hair); i++)
	//).forEach(function(h)
	{
		var h = hair[i];
	    h.x += (last.x - h.x) / 1.5
	    h.y += (last.y + 0.5 - h.y) / 1.5
	    circfill(h.x, h.y, h.size, c)
	    last = new Vector2(h.x, h.y)
	}
}