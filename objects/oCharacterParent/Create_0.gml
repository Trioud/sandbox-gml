/// @description Character Constructor

name = "";
age = "";
emotions_sprites = [];
emotions = {
	base: 0,
}

configure_speed_spr = function(_spr, _speed) {
	if (sprite_exists(_spr)) {
		sprite_set_speed(_spr, _speed, spritespeed_framespersecond);
		return 0;
	} else {
		show_debug_message("ERROR: Sprite doesn't exist");
		return 84;
	}
}

get_emotions_keys = function() {
	return struct_get_names(emotions);
}