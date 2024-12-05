/// @description Insert description here
// You can write your code in this editor

switch(global.state){
	case STATES.CHOOSE:
		if(in_player_hand and face_up)
		{
			if(position_meeting(mouse_x,mouse_y,id))
			{
				target_y = room_height * 0.69;
				
				if(face_index==0){
					obj_narrator.text = "ATTACK: "
					obj_narrator.text += "Will deal ";
					obj_narrator.text += string(1 + obj_dealer.player_is_charged);
					obj_narrator.text += " damage unless the opponent uses PARRY.\n"
					obj_narrator.text += "In that case, will receive ";
					obj_narrator.text += string(2 + obj_dealer.player_is_charged + obj_dealer.opp_is_charged);
					obj_narrator.text += " damage.";
				}
				else if(face_index==1){
					obj_narrator.text = "PARRY: "
					obj_narrator.text += "Will deal ";
					obj_narrator.text += string(2 + obj_dealer.player_is_charged + obj_dealer.opp_is_charged);
					obj_narrator.text += " damage if the opponent uses ATTACK.\n"
					obj_narrator.text += "Otherwise, this card will do nothing."
				}	
				else if(face_index==2){
					obj_narrator.text = "CHARGE: "
					obj_narrator.text += "Increases power of next ATTACK or PARRY by 1.\n";
					obj_narrator.text += "Bonus damage can be reflected by PARRY.\n";
					obj_narrator.text += "This card is useless if already charged.";
				}
				
				if(mouse_check_button_pressed(mb_left))
				{
					target_x = room_width / 2;
					target_y = room_height * 0.525;
					ds_list_add(obj_dealer.player_selected, id);
					audio_play_sound(snd_card, 1, false);
				}
		}
		else{
			target_y = room_height * 0.7;
		}
	}
		
	break;
	default:
	//show_debug_message("cannot click");
	break;

}