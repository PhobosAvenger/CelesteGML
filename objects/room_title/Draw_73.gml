delay--;
if (delay < -30)
    destroy_object(self);
else if (delay < 0)
{	
	if (!E.customMap) {
	    rectfill(24, 58, 104, 70, 0);
	    if (E.e_room.x == 3 && E.e_room.y == 1) {
	        print("OLD SITE", 48, 62, 7);
			E.Area_current = "OLD SITE"
		}
	    else if (E.level_index() == 30) {
	        print("SUMMIT", 52, 62, 7);
			E.Area_current = "SUMMIT"
		}
	    else
	    {
	        var level = (1 + E.level_index()) * 100;
	        print(string(level) + "M", 52 + (level < 1000 ? 2 : 0), 62, 7);
			E.Area_current = string(level) + "M"
	    }

		E.draw_time(4, 4);
	}
	else
	{
		// CUSTOM MAP
	    rectfill(24, 58, 104, 70, 0);

			if (G._mapCurr < ROOM_LIMIT) 
			{
		        var level = (1 + G._mapCurr) * 100;
		        print(string(level) + "M", 52 + (level < 1000 ? 2 : 0), 62, 7);
				E.Area_current = string(level) + "M"
			} 
			else if (G._mapCurr == ROOM_LIMIT) {
				print("SUMMIT", 52, 62, 7);
				E.Area_current = "SUMMIT"
			}

		E.draw_time(4, 4);
	}
}