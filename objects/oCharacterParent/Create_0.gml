/// @description Character Constructor

name = "";
age = "";
emotions_sprites = [];
emotions = {
	base: 0,
}
display = true;	
//Animations Lists
appear = false;
disappear = false;

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

stop_talking = function() {
	image_index = 0;
	image_speed = 0;
}

start_talking = function() {
	image_speed = 2;
}

change_sprite = function(_emotion) {
	sprite_index = emotions_sprites[_emotion];
}

// EFFECTS

// Leave the scene with opacity
e_leave = function() {
	image_alpha = clamp(image_alpha - 0.05, 0, 1);
}

// Enter the scene with opacity
e_appear = function() {
	image_alpha = clamp(image_alpha + 0.05, 0, 1);
}

reset_animation = function() {
	appear = false;
	disappear = false;
}