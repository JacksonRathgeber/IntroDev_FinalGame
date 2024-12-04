/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_narrator,0,x,y);

draw_set_font(narrator_font);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(x+30, y+25, text);

/*
for(i=0; i<ds_list_size(text_list); i++){
	
	draw_set_alpha(1-(ds_list_size(text_list)-i)*0.2);
	
	for(j=0; j<ds_list_size(text_list[| i]); j++){
		
		draw_text(x+30, y+20*j+40*(ds_list_size(text_list)-i), text_list[| i][| j]);
		
	}
}
*/