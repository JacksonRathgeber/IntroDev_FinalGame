/// @description Insert description here
// You can write your code in this editor

switch(global.state){
	case STATES.CHOOSE:
		if(in_player_hand and face_up)
		{
			if(position_meeting(mouse_x,mouse_y,id))
			{
				target_y = room_height * 0.68;
				
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