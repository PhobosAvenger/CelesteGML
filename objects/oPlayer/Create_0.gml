event_inherited(); //ClassicObject();

p_jump = false;
p_dash = false;
grace = 0;
jbuffer = 0;
djump = false;
dash_time = 0;
dash_effect_time = 0;
dash_target = new Vector2(0, 0);
dash_accel = new Vector2(0, 0);

spr_off = 0;
was_on_ground = false;

Inputs();

spr = 1;
djump = E.max_djump;
hitbox = new Rectangle(1, 3, 6, 5);

create_hair(self);

