/// @description Insert description here
// You can write your code in this editor

//show_debug_message("X = ", _mx, "Y :", _my);
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _width = display_get_gui_width();
var _height = display_get_gui_height();


/*
-X1Y1+------------+ 
	|            |
	|            |
	|            |
	|            |
	+------------+ Y2 X2
	
	50 + 
*/

var _j = 20;

for (var _i = 0; array_length(arr_questions) > _i ; _i++) {
	show_debug_message(_i);
	_j = _j + 40;
	units = {mx: _mx, 
			my: _my, 
			x1: 120,
			x2: _width - 120,
			y1: 50 + _j,
			y2: 50 + _j + 30,
			outline: false};
	arr_questions[_i].rctgl.set_units(units);
	answer = arr_questions[_i].rctgl._is_hovered();
	if (answer != -1) {
		var _index = arr_questions[_i].index;
		insert(questions[_i].answers);
		instance_destroy(self);
		exit;
	}
	arr_questions[_i].rctgl.draw_with_txt();
}