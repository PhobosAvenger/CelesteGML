/// @description Insert description here
// You can write your code in this editor

spd.y = appr(spd.y, 0, 0.5);
var hit = collide(oPlayer,0, 0);
if (spd.y == 0 && hit != noone)
{
    //G.music_timer = 45;
    //E.sfx(51);
    E.freeze = 10;
    E.shake = 10;
    destroy_object(self);
    E.max_djump = 2;
    hit.djump = 2;
}

E.spr(102, x, y);
var off = E.frames / 30;
for (var i = 0; i <= 7; i++)
    circfill(x + 4 + Cos(off + i / 8) * 8, y + 4 + Sin(off + i / 8) * 8, 1, 7);