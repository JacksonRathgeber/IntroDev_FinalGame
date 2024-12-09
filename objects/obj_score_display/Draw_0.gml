/// @description Insert description here
// You can write your code in this editor

draw_set_font(font);
draw_set_color(#CC0000);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_self();

draw_text(x,y,global.health_arr[health_var]);