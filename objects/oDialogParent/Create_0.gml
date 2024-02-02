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
questions = "";
animation = false;
speaking = false;
choice = false;
len = string_length(current_action);
char_current = 1;
char_speed = 0.25; 
ww = 0;
hh = 0;
mask_layer_alpha = 1;
mask_layer_id = layer_get_id("Mask");
mask_layer = layer_background_get_id(mask_layer_id);
character_id = layer_get_id("Character_GUI");
scribble_font_set_default("fnt_bigdialog");
draw_set_font(fnt_bigdialog);
typist = scribble_typist();
typist.in(char_speed, 0);

typist.function_on_complete(function () {
	speaking = false;
	if (current_action.character != "") // In case of character being empty
		current_action.character.stop_talking();
})
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
	return instance_create_layer(_gui_width, _gui_height, character_id, _new_character);
}

//Animations
action_choice = function(_current_action) {
	if (_current_action) {
		if (DIALOGS_TYPE.ANIM == _current_action.type) {
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
	typist.in(char_speed, 0);
}

insert_path_conditional = function(_arr) { // @args: Actions class
	actions.insert_array(_arr);
	current_action = actions.pop();
	questions = "";
	layer_background_alpha(mask_layer, 0);
	action_choice(current_action);
}

talk = function () {
	var _gui_height = display_get_gui_height();
	var _gui_width = display_get_gui_width();
	var _rctgl_margin = 10;
	var _sprite_height = 64;
	var _sprite_dialog_y = _gui_height / 4;
	var _sprite_dialog_x = _gui_width - _rctgl_margin;
	var _sprite_name_y = _sprite_dialog_y + 30;
	var _sprite_name_x = _sprite_dialog_x / 4;

	var _padding = _rctgl_margin * 2;
	var _text_start = current_action.txt_align == fa_left ? _padding : _sprite_dialog_x / 2;

	/*scribble(current_action.dialogue)
	.line_spacing("300%")
	.wrap(_gui_width - _padding - _rctgl_margin)
	.draw(_text_start, (_gui_height - _sprite_dialog_y + _padding / 2), typist) */
	draw_text_ext(_text_start, (_gui_height - _sprite_dialog_y + _padding / 2), "Je suis un individu", 10, 300);

	if (current_action.character != "") {
		scribble(current_action.character.name)
		.draw(_padding, (_gui_height - _sprite_name_y + 8));
	}
}