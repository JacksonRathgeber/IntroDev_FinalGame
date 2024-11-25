/// @description Insert description here
// You can write your code in this editor

draw_set_font(narrator_font);
draw_set_color(c_white);

for(i=0; i<ds_list_size(text_list); i++){
	
	draw_set_alpha(1-(ds_list_size(text_list)-i)*0.2);
	
	for(j=0; j<ds_list_size(text_list[| i]); j++){
		
		draw_text(x, y+20*j+50*(ds_list_size(text_list)-i), text_list[| i][| j]);
		
		draw_text(x, y_pos, text_list[| i][| j]);
	}
}