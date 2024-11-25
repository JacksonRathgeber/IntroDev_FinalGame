/// @description Insert description here
// You can write your code in this editor

draw_set_font(font);
draw_set_color(c_red);

draw_text(x,y-25,global.health_arr[health_var]);

draw_sprite(spr_heart, 0, x-120, y-60);