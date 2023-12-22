// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dialogue() constructor {
	_dialogs = [];
	// GML doesn't allow Typing
	// @params { _character : Instance of Character, _content : string, _emotion: int }
	add = function(_character, _content, _emotion = 0) {
		array_push(_dialogs, {character: _character, dialogue: _content, emotion: _emotion});
	}
	pop = function() {
		return array_shift(_dialogs);
	}
	count = function() {
		return array_length(_dialogs);
	}
}