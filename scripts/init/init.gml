
gml_pragma("global", "init()");

randomize();



var _p = part_type_create();

part_type_shape(_p, pt_shape_circle);
part_type_life(_p, 50, 50);

part_type_alpha2(_p, 1, 0);
part_type_color1(_p,c_blue);
part_type_size(_p, 2, 2, 0.1,0);

part_type_speed(_p, 0, 0, 0, 0);
part_type_direction(_p, 0, 0,0,0);

global.ptParry = _p;



var _p2 = part_type_create();

part_type_shape(_p2, pt_shape_disk);
part_type_life(_p2, 75, 100);

part_type_alpha2(_p2, 0.2, 0);
part_type_color1(_p2,c_green);
part_type_size(_p2, 0.5, 2, -0.03,0);
part_type_blend(_p2, true);

part_type_speed(_p2, 1.5, 2, 0, 0);
part_type_direction(_p2, 90, 90,0,0);

global.ptPlayerCharge = _p2;



var _p2 = part_type_create();

part_type_shape(_p2, pt_shape_disk);
part_type_life(_p2, 75, 100);

part_type_alpha2(_p2, 0.2, 0);
part_type_color1(_p2,c_green);
part_type_size(_p2, 0.5, 2, -0.03,0);
part_type_blend(_p2, true);

part_type_speed(_p2, 1.5, 2, 0, 0);
part_type_direction(_p2, 270, 270,0,0);

global.ptOppCharge = _p2;



global.partSystem = part_system_create();
part_system_depth(global.partSystem,-2);



global.health_arr = [15,15];