/// @description Insert description here
// You can write your code in this editor

var text = "-- celeste mountain --#this memorial to those# perished on the climb";
if (collide(oPlayer,4, 0))
{
    if (index < string_length(text))
    {
        index += 0.5;
        if (index >= last + 1)
        {
            last += 1;
            //E.sfx(35);
        }
    }

    var off = new Vector2(8, 96);
    for (var i = 0; i < index; i++)
    {
       	var msg = string_char_at(string_upper(text) , i+1);
		if (msg != "#")
        {
            rectfill(off.x - 2, off.y - 2, off.x + 7, off.y + 6, 7);
            print("" + string(msg), off.x, off.y, 0);
            off.x += 5;
        }
        else
        {
            off.x = 8;
            off.y += 7;
        }
    }
}
else
{
    index = 0;
    last = 0;
}
