event_inherited();
Inputs();

if (E.pause_player) {return;}

input = right_key ? 1 : (left_key ? -1 : 0);

// spikes collide
if (spikes_at(x + hitbox.x, y + hitbox.y, hitbox.Width, hitbox.Height, spd.x, spd.y))
    kill_player(self);

// bottom death
if (y > room_height)
    kill_player(self);

var on_ground  = is_solid(0, 1);
var on_ice	 = is_ice(0, 1);


// smoke particles
if (on_ground && !was_on_ground)
    init_object(smoke, x, y + 4);

var jump = jump_key && !p_jump;
p_jump = jump_key;

if (jump)
    jbuffer = 4;
else if (jbuffer > 0)
    jbuffer--;

var dash = dash_key && !p_dash;
p_dash = dash_key;

if (on_ground) {
    grace = 6;
    if (djump < E.max_djump) {
        //sfx
        djump = E.max_djump;
    }
} else if (grace > 0) 
    grace--;


dash_effect_time--;
if (dash_time > 0) {
    // Smoke 
    init_object(smoke, x, y);
    dash_time--;
    spd.x = appr(spd.x, dash_target.x, dash_accel.x);
    spd.y = appr(spd.y, dash_target.y, dash_accel.y);
}	
else 
{
    // move
    var maxrun = 1
    var accel = 0.6;
    var deccel = 0.15;

    if (!on_ground)
        accel = 0.4
	else if (on_ice)
	{
		accel = 0.05;
		if (input == (flipX ? -1 : 1)) // this it how it was in the pico-8 cart but is redundant?
			accel = 0.05;
	}

    if (abs(spd.x) > maxrun)
        spd.x = appr(spd.x, sign(spd.x) * maxrun, deccel);
	else
        spd.x = appr(spd.x, input * maxrun, accel);

    // Facing
    if (spd.x != 0)
        flipX = (spd.x < 0);

    // Gravity
    var maxfall = 2.0;
    var grav = 0.21;

    if (abs(spd.y) <= 0.15) {
        grav *= 0.5;
    }

    // wall slide
    if (input != 0 && is_solid(input, 0) && !is_ice(input, 0)) {
        maxfall = 0.1;
        if (random(10) < 2) && (!on_ground) // Prevent onground smoke Spamming
			init_object(smoke, x + input * 6, y);
    }

    if (!on_ground)
        spd.y = appr(spd.y, maxfall, grav);

    // jump
    if (jbuffer > 0) 
	{
        if (grace > 0) {
            // normal jump
            jbuffer = 0;
            grace = 0;
            spd.y = -2;
			init_object(smoke, x, y);
        } 
		else 
		{
            // wall jump
            var wall_dir = (is_solid(-3, 0) ? -1 : (is_solid(3, 0) ? 1 : 0));
            if (wall_dir != 0) {
                //sfx
                jbuffer = 0;
                spd.y = -2;
                spd.x = -wall_dir * (maxrun + 1);

                if (is_ice(wall_dir * 3, 0))
					init_object(smoke, x + wall_dir * 6, y);

            }
        }
    }

    var d_full = 5;
    var d_half = d_full * 0.70710678118;

    if (djump > 0 && dash) {
        // Smoke
		init_object(smoke, x, y);
        djump--;
        dash_time = 4;
        E.has_dashed = true;
		dash_effect_time = 10;

		var dash_x_input = input;
        var dash_y_input = (up_key ? -1 : (down_key ? 1 : 0));

		if (dash_x_input != 0) {

            if (dash_y_input != 0) {
                spd.x = dash_x_input * d_half;
                spd.y = dash_y_input * d_half;
            } else {
                spd.x = input * d_full;
                spd.y = 0;
            }
        } else if (dash_y_input != 0) {
            spd.x = 0;
            spd.y = dash_y_input * d_full;
        } else {
            spd.x = (flipX ? -1 : 1);
            spd.y = 0;
        }
		
		E.freeze = 2;
        E.shake = 6;
	    dash_target.x = 2 * sign(spd.x);
	    dash_target.y = 2 * sign(spd.y);
	    dash_accel.x = 1.5;
	    dash_accel.y = 1.5;

	    if (spd.y < 0)
            dash_target.y *= 0.75;
        if (spd.y != 0)
            dash_accel.x *= 0.70710678118;
        if (spd.x != 0)
            dash_accel.y *= 0.70710678118;
    }
	else if (dash && djump <= 0)
	{
        // Smoke
        init_object(smoke, x, y);
    }
}

// animation
spr_off += 0.25;
if (!on_ground)
{
    if (is_solid(input, 0))
        spr = 5;
    else
        spr = 3;
}
else if (down_key) && (input == 0)
{
    spr = 6;
}
else if (up_key) && (input == 0)
{
	spr = 7;
}
else if (spd.x == 0 || (!left_key && !right_key))
{
	spr = 1;
}
else
{
	spr = 1 + spr_off % 4;
}

// next level
if (y < -4 && E.level_index() < 30  && not E.customMap)
	E.next_room();
else if (y < -4 && G._mapCurr < G._mapCount && E.customMap)
	E.next_room_custom();

// was on the ground
was_on_ground = on_ground;