/// @desc log(Text);
/// @arg Text
function log() {
	var sep = argument[0];
	var text = "";
	if (argument_count > 1)
	{
		for (var i = 0; i < argument_count; i++)
		{
			if (text == "")
			{
				alldata = "{h}:{m}:{s}";
				cur = date_current_datetime();
				hours = date_get_hour(cur)
				minutes = date_get_minute(cur);
				seconds = date_get_second(cur) * 1.0;

				alldata = string_replace(alldata, "{h}", hours);
				alldata = string_replace(alldata, "{m}", minutes);
				alldata = string_replace(alldata, "{s}", seconds);
				text = "["+string(alldata)+"] " +string(argument[i]);
			}else{
				text = text + ", " + string(argument[i])
			}
		}
	}
	else
	{
		text = sep;
	}
	return show_debug_message(text);


}
