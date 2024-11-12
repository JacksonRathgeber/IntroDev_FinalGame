/// @description Insert description here
// You can write your code in this editor

enum STATES
{
	DEAL,
	CHOOSE,
	COMPARE,
	RESOLVE,
	RESHUFFLE
}

global.state = STATES.DEAL;

hand_x_offset = 100;
deck_y_offset = 2;

num_cards = 30;

deck = ds_list_create();
player_hand = ds_list_create();
player_selected = ds_list_create();
opponent_hand = ds_list_create();
opponent_selected = ds_list_create();
discard = ds_list_create();

/*
player_health = 10;
opp_health = 10;
*/

player_is_charged = 0;
opp_is_charged = 0;

comparison_done = false;

cards_shuffled = 0;
movement_done = false;

move_timer = 0;
delay_timer = 0;

for(var _i = 0; _i < num_cards; _i++)
{
	var _new_card = instance_create_layer(x,y,"Cards", obj_card);
	//_new_card.face_index = _i % 3;
	_new_card.face_index = (_i % 5) div 2;
	_new_card.face_up = false;
	_new_card.in_player_hand = false;
	_new_card.in_opp_hand = false;
	_new_card.target_x = x;
	_new_card.target_y = y;
	ds_list_add(deck, _new_card);
	//show_debug_message(_new_card.face_index);
}

randomize();
ds_list_shuffle(deck);

for(var _i = 0; _i < num_cards; _i++)
{
	deck[| _i].depth = num_cards - _i;
	deck[| _i].target_y = y - (deck_y_offset * _i);
}

audio_play_sound(snd_music, 1, true);


function attack(attacker){
	if(attacker == "player")
	{
		global.health_arr[1] -= 1 + player_is_charged;
		player_is_charged = 0;
		var _anim = instance_create_layer(room_width/2, room_height/2, "Animations", obj_anim_attack);
		show_debug_message("Player attacks!");
		
	}
	else if(attacker == "opp")
	{
		global.health_arr[0] -= 1 + opp_is_charged;
		opp_is_charged = 0;
		var _anim = instance_create_layer(room_width/2, room_height/2, "Animations", obj_anim_attack);
		_anim.image_angle = 180;
		show_debug_message("Opponent attacks!");
		
	} else 
	{
		show_debug_message("Invalid attack parameter.");
		
	}
	audio_play_sound(snd_attack, 1, false);
}

function parry(parrier){
	if(parrier == "player")
	{
		global.health_arr[1] -= 2 + player_is_charged + opp_is_charged;
		player_is_charged = 0;
		opp_is_charged = 0;
		//var _anim = instance_create_layer(room_width/2, room_height/2, "Animations", obj_anim_attack);
		part_particles_create(global.partSystem, room_width/2, 3*room_height/4, global.ptParry, 1);
		show_debug_message("Player parries!");
		
	}
	else if(parrier == "opp")
	{
		global.health_arr[0] -= 2 + player_is_charged + opp_is_charged;
		player_is_charged = 0;
		opp_is_charged = 0;
		//var _anim = instance_create_layer(room_width/2, room_height/2, "Animations", obj_anim_attack);
		//_anim.image_angle = 180;
		part_particles_create(global.partSystem, room_width/2, room_height/4, global.ptParry, 1);
		show_debug_message("Opponent parries!");
		
	} else 
	{
		show_debug_message("Invalid parry parameter.");
		
	}
	audio_play_sound(snd_parry, 1, false);
}

function charge(user){
	if(user == "player")
	{
		if(!player_is_charged)
		{
			player_is_charged = 2;
			show_debug_message("Player charges!");
		}
		else
		{
			show_debug_message("Player is already charged!");
		}
		
	}
	else if(user == "opp")
	{
		if(!opp_is_charged)
		{
			opp_is_charged = 2;
			show_debug_message("Opponent charges!");
		}
		else
		{
			show_debug_message("Opponent is already charged!");
		}
		
	} else 
	{
		show_debug_message("Invalid charge parameter.");
		
	}
	audio_play_sound(snd_charge, 1, false);
}

