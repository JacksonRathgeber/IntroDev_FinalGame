/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);

draw_set_font(title_font);
draw_text(room_width/2, room_height/6, "KNIGHTFALL");

draw_set_font(text_font);
draw_text(room_width/2, 3*room_height/5, @"INSTRUCTIONS:

Each round, click a card from your hand to play it.

Deal damage to your opponent with 
red ATTACK cards (depicting a sword).

Reflect your opponent's attack with 
blue PARRY cards (depicting a shield).

Power up your next attack or parry with 
green CHARGE cards (depicting an up arrow).


Press SPACE to begin the game.");
