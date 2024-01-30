/// @description Insert description here
// You can write your code in this editor

//show_debug_message("X = ", _mx, "Y :", _my);
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _width = display_get_gui_width();
var _height = display_get_gui_height();
var _units = {};

for (var _i = 0; array_length(arr_questions) > _i ; _i++) {
	show_debug_message(_i);
	_units = {mx: _mx, my: _my, x1: _width / 3, y1: _height / 2 + _i * 30, x2: _width - _width / 3, y2: _height / 2 + 20 + _i * 30, outline: false};
	answer = arr_questions[_i].set_units(_units);
	answer = arr_questions[_i]._is_hovered();
	arr_questions[_i].draw_with_txt();
}