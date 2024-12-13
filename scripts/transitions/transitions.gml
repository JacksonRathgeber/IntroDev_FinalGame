global.midTransition = false;
global.roomTarget = -1;

function TransitionPlaceSequence(_type){
	
	if (layer_exists("Transition")){
		layer_destroy("Transition");
	}
	var _lay = layer_create(-9999, "Transition");
	var _layer_seq = layer_sequence_create(_lay, 0, 0, _type);
	return _layer_seq;
}

function TransitionStart(_roomTarget, _typeOut, _typeIn){

	if(!global.midTransition){
		
		global.midTransition = true;
		global.roomTarget = _roomTarget;
		var _out_seq = TransitionPlaceSequence(_typeOut);
		layer_set_target_room(_roomTarget);
		var _in_seq = TransitionPlaceSequence(_typeIn);
		layer_reset_target_room();
		return _out_seq;
	}
}

function TransitionChangeRoom(){
	
	room_goto(global.roomTarget);
}

function TransitionFinished(){
	
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}