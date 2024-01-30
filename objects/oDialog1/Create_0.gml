/// @description First Dialog Interaction
// You can write your code in this editor

event_inherited();

test = add_character(oCharacterTest);
dummy = add_character(oCharacterDummy);

test.image_alpha = 0;
dummy.image_alpha = 0;

N("", "Sunday 21 January - 10:30\n\nMain Avenue", 0 , fa_center);
A(test, "appear");
N(test, "Flo le gros zbob");
A(test, "disappear");
A(dummy, "appear");
Q(dummy, "Hi Test, I'm doing well, thanks. And you?", ["Doing good", "Doing well"]);
N(test, "I'm a bit frustrated with this new project I'm working on.");
N(test, "It's just so complicated and nothing seems to be working!", 1);
N(dummy, "Oh no, that sounds tough. Is there anything I can help with?");
N(test, "Maybe, I just can't figure out why my code isn't running correctly.", 1);
N(dummy, "Let's take a look together. Sometimes a fresh pair of eyes can spot something you might have missed.");
N(test, "Thanks, Dummy. I appreciate it.");