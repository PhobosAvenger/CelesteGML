function load_room(x, y){
	E.has_dashed = false;
	E.has_key = false;

	// remove existing objects
	for (var i = 0; i < E.objects.size; i++){
		instance_destroy(E.objects.get(i));
	}
	E.objects.clear();

    // current room
    E.e_room.x = x;
    E.e_room.y = y;
	
	// entities
	for (var tx = 0; tx < 16; tx ++)
	{
	    for (var ty = 0; ty < 16; ty ++)
	    {
	        var tile = mget(E.e_room.x * 16 + tx, E.e_room.y * 16 + ty);
			
			if (tile == 0) continue;
			
			if (tile == 1)
				E.Act_Layer = LAYER_PLAYER;
			else
				E.Act_Layer = LAYER_OBJECTS;

	        if (tile == 11)
	            init_object(platform, tx * 8, ty * 8).dir = -1;
	        else if (tile == 12)
	            init_object(platform, tx * 8, ty * 8).dir = 1;
	        else
	        {
	            obj = noone;

	            if (tile == 1)
	                obj = oSpawnPoint;
	            else if (tile == 18)
	                obj = spring;
	            else if (tile == 22)
	                obj = balloon;
	            else if (tile == 23)
	                obj = fall_floor;
	            else if (tile == 86)
	                obj = memorial;
	            else if (tile == 96)
	                obj = big_chest;
	            else if (tile == 118)
	                obj = flag;
	            else if (!E.got_fruit[1 + E.level_index()])
	            { 
	                if (tile == 26)
	                    obj = fruit;
	                else if (tile == 28)
	                    obj = fly_fruit;
	                else if (tile == 64)
	                    obj = fake_wall;
	                else if (tile == 8)
	                    obj = key;
	                else if (tile == 20)
	                    obj = chest;
	            }

	            if (obj != noone){
	                init_object(obj, tx*8, ty*8, tile);
				}
	        }
	    }
	}
	//E.start_game = true;
	if (!is_title())
		init_object(room_title, 0, 0);
}

function load_room_custom(){
	E.has_dashed = false;
	E.has_key = false;

	// remove existing objects
	for (var i = 0; i < E.objects.size; i++){
		instance_destroy(E.objects.get(i));
	}
	E.objects.clear();
	
	// Next Room
		E.tilemap = G._MapFile._roomData[G._mapCurr].mapData;
		
    // current room
	    E.e_room.x = 0;
	    E.e_room.y = 0;
	
	// entities
	for (var tx = 0; tx < 16; tx ++)
	{
	    for (var ty = 0; ty < 16; ty ++)
	    {
	        var tile = mget(E.e_room.x * 16 + tx, E.e_room.y * 16 + ty);
			

			if (tile == 0) continue;
			
			if (tile == 1)
				E.Act_Layer = LAYER_PLAYER;
			else
				E.Act_Layer = LAYER_OBJECTS;

	        if (tile == 11)
	            init_object(platform, tx * 8, ty * 8).dir = -1;
	        else if (tile == 12)
	            init_object(platform, tx * 8, ty * 8).dir = 1;
	        else
	        {
	            obj = noone;

	            if (tile == 1)
	                obj = oSpawnPoint;
	            else if (tile == 18)
	                obj = spring;
	            else if (tile == 22)
	                obj = balloon;
	            else if (tile == 23)
	                obj = fall_floor;
	            else if (tile == 86)
	                obj = memorial;
	            else if (tile == 96)
	                obj = big_chest;
	            else if (tile == 118)
	                obj = flag;
	            else if (!E.got_fruit[1 + G._mapCurr])
	            { 
	                if (tile == 26)
	                    obj = fruit;
	                else if (tile == 28)
	                    obj = fly_fruit;
	                else if (tile == 64)
	                    obj = fake_wall;
	                else if (tile == 8)
	                    obj = key;
	                else if (tile == 20)
	                    obj = chest;
	            }

	            if (obj != noone){
	                init_object(obj, tx*8, ty*8, tile);
				}
	        }
	    }
	}
	//E.start_game = true;
	if (!is_title())
		init_object(room_title, 0, 0);
}


