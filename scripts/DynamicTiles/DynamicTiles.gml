function DynamicTiles() {
	/*
	    Returns the tile index of the appropriate tile after checking tiles to the North, West, East, and South
	*/

	var index,north_tile,south_tile,west_tile,east_tile,size;

	size = TILESIZE;

	// Directional check
	north_tile = place_meeting(x,y-size,object_index);
	west_tile = place_meeting(x-size,y,object_index);
	east_tile = place_meeting(x+size,y,object_index);
	south_tile = place_meeting(x,y+size,object_index);

	//perform 4 bit Bitmasking calculation
	index = north_tile + 2*west_tile + 4*east_tile + 8*south_tile;

	return index;


}
