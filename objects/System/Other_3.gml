/// @description Save INI Editor Config

// Register INI CAM POSITION
ini_open("Config/Settings.ini");
ini_write_real("Camera", "X", camX);
ini_write_real("Camera", "Y", camY);
ini_close();