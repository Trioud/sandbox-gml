// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Actions() constructor {
	_dialogs = [];
	// GML doesn't allow Typing
	// @params { _character : Instance of Character, _content : string, _emotion: int }
	push = function(_object) {
		array_push(_dialogs, _object);
	}
	add_dialog = function(_character, _content, _emotion = 0, _txt_align = fa_left) {
		push({
			type: DIALOGS_TYPE.NEW,
			character: _character,
			dialogue: _content, 
			emotion: _emotion, 
			animation: "", 
			txt_align: _txt_align});
	}
	add_anim = function(_character, _anim, _emotion = 0) {
		push({
			type: DIALOGS_TYPE.ANIM,
			character: _character,
			animation: _anim, 
			emotion: _emotion});
	}
	add_questions = function(_character, _questions,  _anim, _emotion = 0) {
		push({
			type: DIALOGS_TYPE.QUESTIONS,
			character: _character, 
			questions: _questions, 
			animation: _anim, 
			emotion: _emotion});
	}
	pop = function() {
		return array_shift(_dialogs);
	}
	count = function() {
		return array_length(_dialogs);
	}
}