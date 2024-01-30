/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_released(vk_anykey))
	display = true;
if (display == true) {
	// show_debug_message(string(char_current) + " " + string(len));
	
	// SPEAK EVENT
	if (floor(char_current) == len)
		speaking = false;
	// A REWORK
	if (speaking == false && 
		current_action != "" && 
		current_action.animation == "") {
		if (current_action.character != "")
			current_action.character.stop_talking();
	}
	if (animation == true) {
		if (current_action.animation == "appear") {
			current_action.character.appear = true;
			current_action.character.disappear = false;
			current_action.character.change_sprite(current_action.emotion);
			if (current_action.character.image_alpha == 1) {
				animation = false;
				current_action = actions.pop();
				action_choice(current_action);
			}
		}
		if (current_action.animation == "disappear") {
			current_action.character.appear = false;
			current_action.character.disappear = true;
			current_action.character.change_sprite(current_action.emotion);
			if (current_action.character.image_alpha == 0) {
				animation = false;
				current_action = actions.pop();
				action_choice(current_action);
			}
			//else
			//	current_action.animation = "end";
		}
	}
	// Talk SPEED UP and next Dialog
	if (keyboard_check_released(vk_anykey)) {
		if (speaking == true) {
			// Modify Speed if needed
			char_speed = 1;
		}
		else if (animation == true) {
		}
		else {
			current_action = actions.pop();
			action_choice(current_action);
		}
	}
}

