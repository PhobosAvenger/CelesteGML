/// @description Return


// Clear Game Objects
if (instance_exists(GameSystem)) {
	instance_deactivate_all(true)
	instance_destroy(GameSystem)
}

if (global.currentScreen == SCR_TEST_ROOM) {
	global.currentScreen = SCR_EDITOR;
	reload_tiles()	
} else {

	// Clear Editor Blocks
	if (instance_exists(oBlock)) {
		instance_destroy(oBlock)
	}

	// Clear Array Files
	_files = [];

	// Return to Main Menu
	global.currentScreen = SCR_MAINMENU;

	// Reset Camera Default
	camera_set_view_pos(view_camera[0], 0, 0);
	camera_set_view_size(view_camera[0], base_width, base_height);

	// Reset Menus
	menu_x_target = gui_width + gui_margin;
	menu_control = true;
}