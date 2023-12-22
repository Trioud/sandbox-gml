/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

name = "Test";
emotions_sprites = [spr_test_base, spr_test_mad];
emotions.mad = 1;
for (var _i = 0; _i < array_length(emotions_sprites) ;_i++) {
	configure_speed_spr(emotions_sprites[_i], 2);
}