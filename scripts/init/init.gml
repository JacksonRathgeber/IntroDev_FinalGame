
gml_pragma("global", "init()");

randomize();



var _p = part_type_create();

part_type_shape(_p, pt_shape_circle);
part_type_life(_p, 50, 50);

part_type_alpha2(_p, 1, 0);
part_type_color1(_p,#87CEEB);
part_type_size(_p, 2, 2, 0.1,0);

part_type_speed(_p, 0, 0, 0, 0);
part_type_direction(_p, 0, 0,0,0);

global.ptParry = _p;



var _p3 = part_type_create();

part_type_shape(_p3, pt_shape_disk);
part_type_life(_p3, 20, 40);

part_type_alpha2(_p3, 0.2, 0);
part_type_color1(_p3,c_green);
part_type_size(_p3, 0.25, 0.75, -0.01,0);
part_type_blend(_p3, true);

part_type_speed(_p3, 1.5, 3, 0, 0);
part_type_direction(_p3, 90, 90,0,0);

global.ptPlayerCharge = _p3;



var _p2 = part_type_create();

part_type_shape(_p2, pt_shape_disk);
part_type_life(_p2, 20, 40);

part_type_alpha2(_p2, 0.2, 0);
part_type_color1(_p2,c_green);
part_type_size(_p2, 0.25, 0.75, -0.01,0);
part_type_blend(_p2, true);

part_type_speed(_p2, 1.5, 3, 0, 0);
part_type_direction(_p2, 270, 270,0,0);

global.ptOppCharge = _p2;



global.partSystem = part_system_create();
part_system_depth(global.partSystem,-5);

global.playerCharge = part_system_create();
part_system_depth(global.partSystem,-100);


var _pS = part_type_create();

part_type_shape(_pS, pt_shape_disk);
part_type_life(_pS, 200, 400);

part_type_alpha1(_pS, 0.55);
part_type_color1(_pS,c_white);
part_type_size(_pS, 0.025, 0.075, 0,0);

part_type_speed(_pS, 2, 8, 0, 0);
part_type_direction(_pS, 195, 255,0,0.2);

global.ptSnow = _pS;



global.health_arr = [15,15];