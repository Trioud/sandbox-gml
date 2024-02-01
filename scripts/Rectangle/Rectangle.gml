// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// _units = {x1: , y1: , x2: , y2: , outline}

function Rectangle (_text = "") constructor {
	units = "";
	content_txt = _text;
	hovercheck = false;
	function draw (_color = c_red) {
		draw_rectangle(units.x1, units.y1 , units.x2, units.y2, units.outline);
	}
	function dialogue_on_hover () {
		draw_set_color(c_red);
		if mouse_check_button(mb_left) {
			return content_txt;
	    }
		return -1;
	}
	
	function set_units(_units) {
		units = _units;
		hovercheck = point_in_rectangle(units.mx, units.my, units.x1, units.y1 , units.x2, units.y2);
	}
	function draw_with_txt () {
		draw();
		var _middle_y = units.y1 + ((units.y2 - units.y1) / 2) / 2;
		var _middle_x = ((units.x2 - units.x1) / 2) + units.x1;
		draw_set_color(c_red);
		draw_set_halign(fa_center);
		draw_text_ext(_middle_x, _middle_y, content_txt, 1 , 2000);
	}
	function _is_hovered() {
		if (hovercheck) {
			return dialogue_on_hover();
		}
		else draw_set_color(c_white);
		return -1;
	}
}