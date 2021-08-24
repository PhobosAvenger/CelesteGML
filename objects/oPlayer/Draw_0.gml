if (x < -1 || x > 121)//room_width-sprite_width/2)
{
    x = clamp(x, -1, 121);//room_width-sprite_width/2);
    spd.x = 0;
}

draw_hair(self, flipX ? -0.5 : 1.5, djump);
draw_player(self, djump);
