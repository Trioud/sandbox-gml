/// @description Insert description here
// You can write your code in this editor

dialogue = new Dialogue();
#macro N dialogue.add
display = false;
current_dialog = "";
speaking = false;
len = string_length(current_dialog);
char_current = 1;
char_speed = 0.25; 

var _base_w = 640;
var _base_h = 480;
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
}