function pal(a,b)
{
	E.paletteSwap = E.colors[a];
	//E.alphaSwap = b;
}

function circfill(x, y, r, c) 
{
	var color = E.colors[(c) % 16];
	draw_set_colour(color);
	
	if (r <= 1)
	{
		draw_rectangle(x - 1, y, x + 1, y, false);
		draw_rectangle(x, y - 1, x, y + 1, false);
	}
	else if (r <= 2)
	{
		draw_rectangle(x - 1, y-2, x + 2, y + 1, false);
		draw_rectangle(x, y - 2, x + 1, y + 2, false);
		draw_rectangle(x-2, y - 1, x + 3, y, false);
	}
	else if (r <= 3)
	{
		draw_rectangle(x - 2, y-0, x + 3, y + 2, false);
		draw_rectangle(x - 0, y - 2, x + 1, y + 4, false);
		draw_rectangle(x - 1, y - 1, x + 2, y + 3, false);
	}
}

function rectfill(x, y, x2, y2, c) {
	var left = min(x, x2);
	var top = min(y, y2);
	var width = max(x, x2);
	var height = max(y, y2);

	if (argument_count > 5)
	{
		draw_set_alpha(argument[5])
	}
	
	if (c < 16)
		var _color = G.colors[(c) % 16];
	else
		var _color = c;
		

	draw_set_colour(_color);
	draw_rectangle(left, top, width, height, false);
	
	if (argument_count > 5)
	{
		draw_set_alpha(1) // reset
	}
}

function print(str, x, y, clr){
	
	// Fix Text H and V position
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
		
	x = flr(x);
	y = flr(y);
	var c = E.colors[(clr) % 16];
	draw_set_font(fnt_pico8_game)
    draw_text_color(x,y,str,c,c,c,c,1)
	draw_set_font(-1)
}