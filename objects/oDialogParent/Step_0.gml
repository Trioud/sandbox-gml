/// @description Insert description here
// You can write your code in this editor
if (display == true) {
	// Stop SPEAKING when no more characters are left
	// SPEAK HANDLER
	if (current_action.type == DIALOGS_TYPE.NEW) {
		if (keyboard_check_released(vk_anykey)) { // EVENT ON CLICK
			if (speaking == true) {
				char_speed = 1;
				typist.in(char_speed, 0);
			}
			else {
				current_action = actions.pop();
				action_choice(current_action);
			}
		}
	}
	else if (current_action.type == DIALOGS_TYPE.QUESTIONS) {
		/*if (floor(char_current) == len) { // If no more characters to display
			speaking = false;
			if (mask_layer_alpha > 0.6)
				mask_layer_alpha += 0.05;
			layer_background_alpha(mask_layer, 0.4);
			if (current_action.character != "") // In case of character being empty
				current_action.character.stop_talking();
		}
		else
			speaking = true; */
		if (keyboard_check_released(vk_anykey)) { // EVENT ON CLICK
			if (speaking == true) {
				char_speed = 1;
				typist.in(char_speed, 0);
			}
		}
	}
	// ANIM HANDLER
	else if (current_action.type == DIALOGS_TYPE.ANIM) {
		switch (current_action.animation)
		{
			case "appear":
				current_action.character.appear = true;
				current_action.character.disappear = false;
				current_action.character.change_sprite(current_action.emotion);
				if (current_action.character.image_alpha == 1) {
					animation = false;
					current_action = actions.pop();
					action_choice(current_action);
				}
			break;
			case "disappear":
				current_action.character.appear = false;
				current_action.character.disappear = true;
				current_action.character.change_sprite(current_action.emotion);
				if (current_action.character.image_alpha == 0) {
					animation = false;
					current_action = actions.pop();
					action_choice(current_action);
				}
			break;
			default:
				show_debug_message("[ERR] : Animation not FOUND");
			
		}
	}
	
}

if (!display) {
	if (keyboard_check_released(vk_anykey)) {
		display = true;
		current_action = actions.pop();
		next_action(current_action);
	}
}

/*if (display == true) {
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
*/
