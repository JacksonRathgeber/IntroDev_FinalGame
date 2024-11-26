/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_space)){
	script_execute(init);
	audio_stop_all();
	game_restart();
}

part_particles_create(global.partSystem, room_width + irandom(500), irandom_range(-300, 300), global.ptSnow, 1);
