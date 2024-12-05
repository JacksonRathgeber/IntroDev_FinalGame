/// @description Insert description here
// You can write your code in this editor

//text_list = ds_list_create();

text = "";

narrator_font = font_add("IMMORTAL.ttf", 14, false, false, 32, 127);

/*
function write_text(full_text, display){
	
	if(string_length(full_text)>string_length(display)){
		for(var i=0; i<string_length(full_text); i++){
			display += string_char_at(full_text,i);
		}
	}
}
*/

function draw_text_scrolling(text_x, text_y, text_str, text_spd, text_slp, text_snd){

    if(!variable_instance_exists(self.id, "_text_char")){
    
        _text_char = 0;
        _text_prev = 0;
        _text_sleep = 0;
    
    }
 
    var text_ind = floor(_text_char);
    var text_chr = string_char_at(text_str, text_ind);
 
    if (text_ind != string_length(text_str)){
 
        if (_text_sleep == 0){
 
            if !((text_chr == ".") || (text_chr == ",") || (text_chr == "?") || (text_chr == "!")){
    
                _text_char += text_spd;
        
                _text_char = min(_text_char, string_length(text_str));

                if (text_ind > _text_prev) && (text_snd != undefined) && audio_exists(text_snd){
            
                    audio_stop_sound(text_snd);
                    audio_play_sound(text_snd, 0, false);
            
                }
        
                _text_prev = text_ind;
    
            }else{
        
                _text_sleep = text_slp;
        
            }
    
        }else{

            if (_text_sleep == 1){

                _text_char = text_ind + 1;
        
            }
    
            _text_sleep--;
    
        }
    
    }
 
    draw_text_ext(text_x, text_y, string_copy(text_str, 1, text_ind), 25, room_height*0.75);
    
}

function draw_text_reset(text){
	
	if(variable_instance_exists(id, "_text_char")){
    
    _text_char = 0;
    _text_prev = 0;
    _text_sleep = 0;
    
	}
}