/// @description Insert description here
// You can write your code in this editor

actions = new Actions();
#macro N actions.add_dialog
#macro A actions.add_anim
#macro Q actions.add_questions

enum DIALOGS_TYPE {
	NEW,
	ANIM,
	QUESTIONS,
}

display = false;
dialogue_idx = 0;
current_action = "";
animation = false;
speaking = false;
len = string_length(current_action);
char_current = 1;
char_speed = 0.25; 
ww = 0;
hh = 0;

/* // A REFACTOR
var _base_w = 640;
var _base_h = 360;
var _aspect = display_get_width() / display_get_height();


// A REFACTOR
if (_aspect > 1)
    {
    //landscape
    ww = _base_h * _aspect;
    hh = _base_h;
    display_set_gui_maximise((display_get_width() / ww), (display_get_height() / hh), 0, 0);
    }
else
    {
    //portrait
    ww = _base_w;
    hh = _base_w / _aspect;
    display_set_gui_maximise((display_get_width() / ww), (display_get_height() / hh), 0, 0);
}*/


add_character = function(_new_character) {
	var _gui_height = 384;
	var _gui_width = 640 / 2;
	return instance_create_layer(_gui_width, _gui_height, layer, _new_character);
}

//Animations

appear = function() {
	
}

disappear = function() {
	
}

action_choice = function(_current_action) {
	if (_current_action) {
		if (_current_action.animation != "") {
			_current_action.character.stop_talking();
			animation = true;
		}
		else {
			next_action(_current_action);
		}
	}
}

next_action = function(_current_action) {
	if (_current_action.character != "") {
		_current_action.character.start_talking();
		_current_action.character.change_sprite(_current_action.emotion);
	}
	with (self) {
		char_speed = 0.25;
		speaking = true;
		char_current = 1;
	}
}