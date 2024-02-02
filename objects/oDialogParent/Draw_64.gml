/// @description GUI Dialog Parent Draw
// A REFACTOR
/*
var _base_w = 640;
var _base_h = 360;
var _aspect = display_get_width() / display_get_height();


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

if (display) {

	var _gui_height = display_get_gui_height();
	var _gui_width = display_get_gui_width();
	var _rctgl_margin = 10;
	var _sprite_height = 64;
	var _sprite_dialog_y = _gui_height / 4;
	var _sprite_dialog_x = _gui_width - _rctgl_margin;
	var _sprite_name_y = _sprite_dialog_y + 30;
	var _sprite_name_x = _sprite_dialog_x / 4;
	

	draw_set_color(c_white);
	// Dialog Container
	draw_rectangle(_rctgl_margin, _gui_height - _sprite_dialog_y, _sprite_dialog_x, _gui_height - _rctgl_margin, true);
	// Character Name Container
	if (current_action.character != "") {
		draw_rectangle(_rctgl_margin, _gui_height - _sprite_name_y , _sprite_name_x, _gui_height - _sprite_dialog_y, true);
	}
	// Draw Sprite

	draw_set_color(c_red);
	if (current_action) {
		if (current_action.type == DIALOGS_TYPE.QUESTIONS) {
			talk();
			if (questions == "" && speaking == false) {
				questions = instance_create_layer(0, 0, layer, oQuestion, {
					questions: current_action.questions,
					insert: insert_path_conditional
				});
				//questions.questions = current_action.questions;
			}
		}

		if (current_action.type == DIALOGS_TYPE.NEW) {
			talk();
		}
		if (!animation && !speaking) {
			draw_sprite(spr_arrow, 0, _sprite_dialog_x - 50, _gui_height - _rctgl_margin - 40)
		}
		// DEBUG
		if (speaking == true) {
			draw_text(0, 0, "SPEAK = TRUE");
		}
		else {
			draw_text(0, 0, "SPEAK = FALSE");
		}
		if (animation == true) {
			draw_text(0, 50, "ANIMATION = TRUE");
		}
		else {
			draw_text(0, 50, "ANIMATION = FALSE");
		}
	}
	else
		instance_destroy(self);
}