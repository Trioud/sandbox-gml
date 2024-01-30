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
	
	draw_set_colour(c_red);
	draw_set_font(fnt_dialog);
	if (current_action) {
		var _str = "Test";
		if (current_action.animation == "") {
			len = string_length(current_action.dialogue);
			if (char_current < len)
		    {
				char_current += char_speed;
		    }
			_str = string_copy(current_action.dialogue, 1, char_current);
			var _padding = _rctgl_margin * 2;
			draw_set_halign(current_action.txt_align);
			var _text_start = current_action.txt_align == fa_left ? _padding : _sprite_dialog_x / 2;
			
			draw_text_ext(_text_start, (_gui_height - _sprite_dialog_y + _padding / 2), _str, 20, _gui_width - _padding - _rctgl_margin);
			draw_set_halign(fa_left);
			if (current_action.character != "") {
				draw_text_ext(_padding, (_gui_height - _sprite_name_y + 8), current_action.character.name, 20, _sprite_name_x);
			}
		}
		if (!animation && !speaking) {
			draw_sprite(spr_arrow, 0, _sprite_dialog_x - 50, _gui_height - _rctgl_margin - 40)
		}
		
		if (current_action.questions) {
			with (instance_create(0, 0, oQuestion)) {
				questions = current_action.questions;
			}
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