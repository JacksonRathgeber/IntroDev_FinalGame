/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);

draw_set_font(title_font);

if(global.health_arr[0]<=0 and global.health_arr[1]>0){
	draw_text(room_width/2, room_height/4, "YOU LOST.");
	
	draw_set_font(text_font);
	draw_text(room_width/2, room_height/3, "This kingdom shall remember you honorably.");
}

else if(global.health_arr[1]<=0 and global.health_arr[0]>0){
	draw_text(room_width/2, room_height/4, "YOU WON!");
	
	draw_set_font(text_font);
	draw_text(room_width/2, room_height/3, "The kingdom rejoices in your victory.");
}

else{
	draw_text(room_width/2, room_height/4, "A DRAW???");
	
	draw_set_font(text_font);
	draw_text(room_width/2, room_height/3, "What a tremendous battle that was!");
}

draw_text(room_width/2, 3*room_height/5, "Press SPACE to play again.");

