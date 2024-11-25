/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

victor = -10;

if(global.health_arr[0]<=0 and global.health_arr[1]>0){
	victor = -1;
	audio_play_sound(snd_lose, 1, false);
}

else if(global.health_arr[1]<=0 and global.health_arr[0]>0){
	victor = 1;
	audio_play_sound(snd_win, 1, false);
}

else{
	victor = 0;
	audio_play_sound(snd_draw, 1, false);
}