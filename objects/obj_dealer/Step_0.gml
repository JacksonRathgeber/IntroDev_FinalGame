/// @description Insert description here
// You can write your code in this editor

/* 

POTENTIAL TO DO LIST:
Text display for exchanges
Menu music
Ending fanfare
Particles in menu (snow?)
Scoring explanation menu
More elegant lerping (scaling for depth?)
Card shadows on table
Better card icon sprites
Better table (background) sprite
Transitions between screens
Further develop story?
*/

switch(global.state){
	case STATES.DEAL:
		if(move_timer == 0){
			
			var _opp_num = ds_list_size(opponent_hand);
			var _player_num = ds_list_size(player_hand);
			if(_opp_num < 3)
			{
				var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
				ds_list_delete(deck, ds_list_size(deck)-1);
				ds_list_add(opponent_hand, _dealt_card);
				_dealt_card.target_x = (room_width/2 - hand_x_offset) + _opp_num * hand_x_offset;
				_dealt_card.target_y = room_height * 0.2;
				_dealt_card.in_opp_hand = true;
				_dealt_card.face_up = false;
				audio_play_sound(snd_card, 1, false);
			}
			else if(_player_num < 3)
			{
				var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
				ds_list_delete(deck, ds_list_size(deck)-1);
				ds_list_add(player_hand, _dealt_card);
				_dealt_card.target_x = (room_width/2 - hand_x_offset) + _player_num * hand_x_offset
				_dealt_card.target_y = room_height * 0.8;
				_dealt_card.in_player_hand = true;
				//_dealt_card.face_up = true;
				audio_play_sound(snd_card, 1, false);
			} else {
				for(var _i = 0; _i < _player_num; _i++){
					var _player_card = ds_list_find_value(player_hand, _i);
					_player_card.face_up = true;
				}
				global.state = STATES.CHOOSE;
			}
		}
		break;
	
	case STATES.CHOOSE:
		if(ds_list_size(obj_dealer.opponent_selected) == 0)
		{
			ds_list_shuffle(opponent_hand);
			var _opp_card = ds_list_find_value(opponent_hand, 0);
			_opp_card.target_x = room_width / 2;
			_opp_card.target_y = room_height * 0.4;
			ds_list_add(opponent_selected, _opp_card);
			audio_play_sound(snd_card, 1, false);
		}
		
		if(ds_list_size(player_selected) == 1 and ds_list_size(opponent_selected) == 1){
			global.state = STATES.COMPARE;
		}
		break;
		
	
	case STATES.COMPARE:
		/*
		if(ds_list_find_value(player_selected, 0).face_index == ds_list_find_value(opponent_selected, 0).face_index){
			show_debug_message("match");
		}
		else{
			show_debug_message("no match");
		}
		*/
		var _player_card = ds_list_find_value(player_selected, 0);
		var _opp_card = ds_list_find_value(opponent_selected, 0)
		_opp_card.face_up = true;
		var _player_ind = _player_card.face_index;
		var _opp_ind = _opp_card.face_index;
		
		
		if(!comparison_done)
		{
			if(_player_ind == 0) //---------------PLAYER ATTACK----------------------
			{
				if(_opp_ind != 1)
				{
					attack("player");
				}
			
			}
			else if(_player_ind == 1) //---------------PLAYER PARRY----------------------
			{
				if(_opp_ind == 0){
					parry("player");
				}
			}
			else { //---------------PLAYER CHARGE----------------------
				charge("player");
			}
		
		
		
			if(_opp_ind == 0) //---------------OPP ATTACK----------------------
			{
				if(_player_ind != 1)
				{
					attack("opp");
				}
			
			}
			else if(_opp_ind == 1) //---------------OPP PARRY----------------------
			{
				if(_player_ind == 0){
					parry("opp");
				}
			}
			else { //---------------OPP CHARGE----------------------
				charge("opp");
			}
			
			comparison_done = true;

			show_debug_message("Player health is now " + string(global.health_arr[0]));
			show_debug_message("Opponent health is now " + string(global.health_arr[1]));
			
		}
		
		
		if(move_timer == 0){
			delay_timer++;
			if(delay_timer == 3){
				global.state = STATES.RESOLVE;
				comparison_done = false;
				delay_timer = 0;
			}
		}
		break;
		
	
	case STATES.RESOLVE:
		comparison_done = false;
		if(move_timer == 0){
			var _card_num = ds_list_size(player_hand) + ds_list_size(opponent_hand);
			var _next_card = noone;
			if(_card_num == 6)
			{
				_next_card = ds_list_find_value(opponent_selected, 0);
				_next_card.in_opp_hand = false;
				ds_list_add(discard, _next_card);
				ds_list_clear(opponent_selected);
				ds_list_delete(opponent_hand, 0);
			}
			else if(_card_num == 5)
			{
				_next_card = ds_list_find_value(player_selected, 0);
				_next_card.in_player_hand = false;
				ds_list_add(discard, _next_card);
				ds_list_clear(player_selected);
				ind = ds_list_find_index(player_hand, _next_card);
				ds_list_delete(player_hand, ind);
			}
			else if(_card_num > 2)
			{
				_next_card = ds_list_find_value(opponent_hand, 0);
				_next_card.in_opp_hand = false;
				ds_list_add(discard, _next_card);
				ds_list_delete(opponent_hand, 0);
			}
			else if(_card_num > 0)
			{
				_next_card = ds_list_find_value(player_hand, 0);
				_next_card.in_player_hand = false;
				ds_list_add(discard, _next_card);
				ds_list_delete(player_hand, 0);
			}
			
			
			
			if(_card_num > 0){
				_next_card.target_x = room_width * 0.9;
				_next_card.target_y = room_height/2 - ds_list_size(discard)*deck_y_offset;
				_next_card.depth = -ds_list_size(discard);
				_next_card.face_up = true;
				audio_play_sound(snd_card, 1, false);
			}
			
			if(_card_num == 0){
				ds_list_clear(player_selected);
				ds_list_clear(opponent_selected);
				ds_list_clear(player_hand);
				ds_list_clear(opponent_hand);
				
				if(global.health_arr[0]<=0 or global.health_arr[1]<=0){
					audio_stop_all();
					room_goto(rm_end);
				}
				else {
					if(ds_list_size(deck) == 0){
						global.state = STATES.RESHUFFLE;
					} else {
						global.state = STATES.DEAL;
					}
				}
			}
		}
		break;
		
	
	case STATES.RESHUFFLE:
		
		if(move_timer%3==0){
			
			#region //------------------------RESHUFFLING PHASE ONE---------------------
			if(cards_shuffled<num_cards and !movement_done)
			{
				var _new_card = ds_list_find_value(discard, ds_list_size(discard)-cards_shuffled-1);
				_new_card.face_up = false;
				_new_card.in_player_hand = false;
				_new_card.in_opp_hand = false;
				_new_card.target_x = x;
				_new_card.target_y = y - (deck_y_offset * cards_shuffled);
			
				_new_card.depth = num_cards - cards_shuffled;
				
				cards_shuffled++;
				
				audio_play_sound(snd_card, 1, false);
			}
			#endregion
			
			else if(!movement_done)
			{
				var _last_card = ds_list_find_value(discard, 0);
				if(_last_card.x == _last_card.target_x and _last_card.y == _last_card.target_y)
				{
					movement_done = true;
					cards_shuffled = 0;
					randomize();
					ds_list_shuffle(discard);
				}
				
			}
			
			#region //------------------------RESHUFFLING PHASE TWO---------------------
			
			/*
			Cards are still in DISCARD pile when they arrive at left stack
			Card list is shuffled first in data
			Cards are then moved visually to match from discard to deck
			
			*/
			else if(ds_list_size(discard)>0 and movement_done)
			{
				/*
				var _active_card = ds_list_find_value(discard, 0);
				ds_list_delete(discard, 0);
				*/
				var _active_card = ds_list_find_value(discard, ds_list_size(discard)-1);
				ds_list_delete(discard, ds_list_size(discard)-1);
				ds_list_add(deck, _active_card);
				_active_card.depth = num_cards - (ds_list_size(deck)-1);
				_active_card.target_y = y - (deck_y_offset * (ds_list_size(deck)-1));
				
				audio_play_sound(snd_card, 1, false);
				
				//show_debug_message(ds_list_size(deck));
			}
			#endregion
			
			else{
				/*
				randomize();
				ds_list_shuffle(deck);
				*/
				cards_shuffled = 0;
				movement_done = false;
				global.state = STATES.DEAL;
			}
		}
		break;
	
}
	
move_timer++;

if(move_timer == 30){
	move_timer = 0;
}

if(player_is_charged){
	part_particles_create(global.partSystem, irandom_range(-5, room_width+5), room_height+5, global.ptPlayerCharge, 2);
}

if(opp_is_charged){
	part_particles_create(global.partSystem, irandom_range(-5, room_width+5), -5, global.ptOppCharge, 2);
}


