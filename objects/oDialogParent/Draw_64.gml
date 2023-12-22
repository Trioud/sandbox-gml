/// @description GUI Dialog Parent Draw


if (display) {

	var _gui_height = display_get_gui_height();
	var _gui_width = display_get_gui_width();
	var _rctgl_margin = _gui_width / 5;
	var _sprite_height = 64;
	var _sprite_dialog_y = _gui_height / 4;
	var _sprite_dialog_x = _gui_width - _rctgl_margin;
	var _sprite_name_y = _sprite_dialog_y + 30;
	var _sprite_name_x = _sprite_dialog_x / 2;
	

	draw_set_color(c_white);
	// Dialog Container
	draw_rectangle(_rctgl_margin, _gui_height - _sprite_dialog_y, _sprite_dialog_x, _gui_height, true);
	// Character Name Container
	draw_rectangle(_rctgl_margin, _gui_height - _sprite_name_y , _sprite_name_x, _gui_height - _sprite_dialog_y, true);
	draw_set_colour(c_red);
	draw_set_font(fnt_dialog);
	if (current_dialog) {
		len = string_length(current_dialog.dialogue);
		if (char_current < len)
	    {
			char_current += char_speed;
	    }
		var _str = string_copy(current_dialog.dialogue, 1, char_current);
		var _padding = _rctgl_margin + 16;
		draw_text_ext(_padding, (_gui_height - _sprite_dialog_y + 16), _str, 20, _gui_width / 2);
		draw_text_ext(_padding, (_gui_height - _sprite_name_y + 8), current_dialog.character.name, 20, _sprite_name_x);
		if (speaking == true) {
			draw_text(0, 0, "SPEAK = TRUE");
		}
		else {
			draw_text(0, 0, "SPEAK = FALSE");
		}
	}
	else
		instance_destroy(self);
}