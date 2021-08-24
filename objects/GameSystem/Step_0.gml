frames = ((frames + 1) % 30);

if (frames == 0 && level_index() < 30)
{
    seconds = ((seconds + 1) % 60);
    if (seconds == 0)
        minutes++;
}

// cancel if freeze
if (freeze > 0)
{
    freeze--;
    return;
}

// screenshake
if (shake > 0 && !DisableScreenShake)
{
	shake--;
	camera(-CAMX,CAMY);
	if (shake > 0)
	{
		camera(-CAMX,CAMY,(-2) + random(5), (-2) + random(5));
	}
}

// restart(soon)
if (will_restart && delay_restart > 0)
{
    delay_restart--;
    if (delay_restart <= 0)
    {
        will_restart = true;
		
		if (!customMap)
			load_room(e_room.x, e_room.y);
		else
			load_room_custom()
    }
}

// start game
if (is_title())
{;
    if (!start_game && (keyboard_check_pressed(ord("C")) || keyboard_check_pressed(ord("X"))))
    {
        start_game_flash = 50;
        start_game = true;
    }
    if (start_game)
    {
        start_game_flash--;
        if (start_game_flash <= -30)
            begin_game();
    }
}