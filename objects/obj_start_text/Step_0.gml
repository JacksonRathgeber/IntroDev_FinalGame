/// @description Insert description here
// You can write your code in this editor

var _cam_x = camera_get_view_x(view_camera[0]);

layer_x("Parallax_Back", _cam_x * 0.9);
layer_x("Parallax_Mid", _cam_x * 0.25);

camera_set_view_pos(camera, x, y);
x = lerp(x, x+scroll_speed, 0.08);

if(keyboard_check_pressed(vk_space)){
	audio_stop_all();
	part_particles_clear(global.partSystem);
	audio_play_sound(snd_start, 1, false);
	transition_layer = TransitionStart(rm_main, seq_fade_out, seq_fade_in);
}

if(global.midTransition && layer_exists("Transition")){
		layer_sequence_x(transition_layer, _cam_x);
}

if(snow_trigger){
	part_particles_create(global.partSystem, camera_get_view_x(camera) + room_width + irandom(200), irandom_range(-600, 400), global.ptSnow, 1);
}

snow_trigger = !snow_trigger;