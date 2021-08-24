function title_screen() {
	E.got_fruit = HashSet(35);
	E.frames = 0;
	E.deaths = 0;
	E.max_djump = 1;
	E.start_game = false;
	E.start_game_flash = 0;

	load_room(7, 3);
}
