/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_released(vk_anykey))
	display = true;
if (display == true) {
	// show_debug_message(string(char_current) + " " + string(len));
	if (floor(char_current) == len)
		speaking = false;
	if (speaking = false) {
		//current_dialog.character.image_speed = 0;
	}
	if (keyboard_check_released(vk_anykey)) {
		if (speaking == true) {
			// SPEED IT UP ?
			char_speed = 1;
		}
		else {
			current_dialog = dialogue.pop();
			if (current_dialog) {
				current_dialog.character.sprite_index = current_dialog.character.emotions_sprites[current_dialog.emotion];
				//alarm[0] = game_get_speed(gamespeed_fps) * (string_length(current_dialog));
				with (self) {
					char_speed = 0.25;
					speaking = true;
					char_current = 1;
				}
			}
		}
	}
}