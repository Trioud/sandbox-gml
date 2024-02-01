/// @description First Dialog Interaction
// You can write your code in this editor

event_inherited();

test = add_character(oCharacterTest);
dummy = add_character(oCharacterDummy);
option1 = new Actions();
option2 = new Actions();
option3 = new Actions();

option4 = new Actions();
option5 = new Actions();
option5.add_dialog(test, "KILLIAN STRIKE");
option4.add_dialog(test, "LE GOAT QUI EST KIKI OUI TOUT A FAIT");

test.image_alpha = 0;
dummy.image_alpha = 0;

N("", "Sunday 21 January - 10:30\n\nMain Avenue", 0 , fa_center);
A(test, "appear");
N(test, "Arthur le gros zbob", 0);
A(test, "disappear");
A(dummy, "appear");
Q(dummy, "Arthur est-il une enorme merde ?", [{txt: "Evidemment", answers: option1._dialogs}, 
											{txt: "Sans aucun putain de doute", answers: option2._dialogs},
											{txt: "Arthur est le GOAT", answers: option3._dialogs}
											]);
option1.add_dialog(dummy, "Le doute n'est pas permis quand nous avons a faire a un idiot pareil");
option1.add_anim(dummy, "disappear");
option1.add_anim(test, "appear");
option1.add_dialog(test, "Mon dieu quel homme quel homme");
option1.add_questions(test, "Tout loin de Killian qui va finir et il est bg, pas vrai ?", [ 
											{txt: "Allez KIKI", answers: option4._dialogs},
											{txt: "KIKI LE GOAT", answers: option5._dialogs}
											]);

option2.add_dialog(dummy, "Oui, sans aucun doute. Ce mec est parti alors qu'il y avait 50 reviews environ a faire.");
option2.add_anim(dummy, "disappear");
option2.add_anim(test, "appear");

option3.add_dialog(dummy, "Je suis pas vraiment d'accord avec ca...");
option3.add_anim(dummy, "disappear");
option3.add_anim(test, "appear");

N(test, "Anyway, I'm a bit frustrated with this new project I'm working on.");
N(test, "It's just so complicated and nothing seems to be working!", 0);
N(dummy, "Oh no, that sounds tough. Is there anything I can help with?");
N(test, "Maybe, I just can't figure out why my code isn't running correctly.", 0);
N(dummy, "Let's take a look together. Sometimes a fresh pair of eyes can spot something you might have missed.");
N(test, "Thanks, Dummy. I appreciate it.");

