/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

name = "Dummy";
emotions_sprites = [spr_dummy_base, spr_dummy_mad];
emotions.mad = 1;
for (var _i = 0; _i < array_length(emotions_sprites) ;_i++) {
	configure_speed_spr(emotions_sprites[_i], 2);
}