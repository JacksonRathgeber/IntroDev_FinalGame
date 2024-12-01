/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);

draw_set_font(title_font);

if(victor == -1){
	draw_text(display_get_gui_width()/2, display_get_gui_height()*0.25, "YOU LOST.");
	
	draw_set_font(text_font);
	draw_text(display_get_gui_width()/2, display_get_gui_height()*0.35, "This kingdom shall remember you honorably.");
}

else if(victor == 1){
	draw_text(display_get_gui_width()/2, display_get_gui_height()*0.25, "YOU WON!");
	
	draw_set_font(text_font);
	draw_text(display_get_gui_width()/2, display_get_gui_height()*0.35, "The kingdom rejoices in your victory.");
}

else if(victor == 0){
	draw_text(display_get_gui_width()/2, display_get_gui_height()*0.25, "A DRAW???");
	
	draw_set_font(text_font);
	draw_text(display_get_gui_width()/2, display_get_gui_height()*0.35, "What a tremendous battle that was!");
}

draw_text(display_get_gui_width()/2, display_get_gui_height()*0.65, "Press SPACE to play again.");

