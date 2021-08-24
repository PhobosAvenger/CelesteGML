function break_fall_floor(obj)
{
	if (obj.state == 0){
	    obj.state = 1;
	    obj.delay = 15; //how long until it falls
	    init_object(smoke, obj.x, obj.y);
	    var hit = obj.collide(spring, 0, -1);
	    if (hit != noone)
	        break_spring(hit);
	}
}

function break_spring(obj)
{
    obj.hide_in = 15;
}

function next_room()
{
	if (e_room.x == 7)
	    load_room(0, e_room.y + 1);
	else
	    load_room(e_room.x + 1, e_room.y);
}

function next_room_custom()
{
	G._mapCurr++;
	load_room_custom();
}

function is_title()
{
    return level_index() == 31;
}

function level_index()
{
    return e_room.x % 8 + e_room.y * 8;
}

function restart_room() {
	E.will_restart = true;
	E.delay_restart = 15;
}


function update_berries() {
	for (var i = 0; i < array_length(E.got_fruit); i++){
		if (E.got_fruit[i])
			score++;
	}	
}

function draw_time(x, y)
{
    var s = seconds;
    var m = minutes % 60;
    var h = flr(minutes / 60);

    rectfill(x, y, x + 32, y + 6, 0);
    print(
	(h < 10 ? "0" : "") + string(h) + ":" + (m < 10 ? "0" : "") + string(m) + ":" + (s < 10 ? "0" : "") + string(s),
	x + 1,
	y + 1,7);
}