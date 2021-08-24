function begin_game() {
	E.frames = 0;
	E.seconds = 0;
	E.minutes = 0;
	E.start_game = false;
	
	// Carrega os Mapas
	load_room(0, 0);
}
