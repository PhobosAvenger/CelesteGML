/// @description Load INI Settings

if (!file_exists("./Config/Settings.ini"))
{
	ini_open("./Config/Settings.ini");
	ini_write_real("Camera", "X", 0);
	ini_write_real("Camera", "Y", 0);
	ini_write_real("Camera", "zoom", 1);
	ini_close();
}