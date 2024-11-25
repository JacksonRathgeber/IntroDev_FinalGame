/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1);

if(abs(x - target_x) > 1){
	x = lerp(x, target_x, 0.2);
} else {
	x = target_x;
}
if(abs(y - target_y) > 1){
	y = lerp(y, target_y, 0.2);
} else {
	y = target_y;
}


if(face_index == 0) sprite_index = spr_attack;
if(face_index == 1) sprite_index = spr_parry;
if(face_index == 2) sprite_index = spr_charge;

if(!face_up) sprite_index = spr_back;

draw_sprite(sprite_index, image_index, x,y);