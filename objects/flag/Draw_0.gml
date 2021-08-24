/// @description Insert description here
// You can write your code in this editor
spr = 118 + (E.frames / 5) % 3;
E.spr(spr, x+5, y);
if (show)
{
    rectfill(32, 2, 96, 31, 0);
    E.spr(26, 55, 6);
    print("x" + string(score), 64, 9, 7);
	E.draw_time(49, 16);
    print("deaths:" + string(E.deaths), 48, 24, 7);
}
else if (collide(oPlayer,0, 0))
{
    //E.sfx(55);
    //G.sfx_timer = 30;
    show = true;
}