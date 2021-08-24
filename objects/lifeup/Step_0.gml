move(spd.x, spd.y);
duration--;
if (duration <= 0)
    destroy_object(self);