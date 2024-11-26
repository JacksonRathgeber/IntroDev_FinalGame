/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_space)){
	audio_stop_all();
	room_goto(rm_main);
	part_particles_clear(global.partSystem);
}

part_particles_create(global.partSystem, room_width + irandom(500), irandom_range(-300, 300), global.ptSnow, 1);
