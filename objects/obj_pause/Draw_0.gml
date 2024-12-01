/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_space) and !pause){
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
}

