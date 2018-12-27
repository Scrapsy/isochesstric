///getCoor(in_x, in_y)
var end_x, end_y, coors, in_x, in_y, offset_x, offset_y, start_x, start_y;
coors = ds_map_create();
in_x = argument0;
in_y = argument1;
start_x = 512;
start_y = 186;
offset_y = in_x * 16 - in_y * 16;
offset_x = -(in_y * 32);
end_x = start_x + (in_x * 32) + offset_x;
end_y = start_y + (in_y * 32) + offset_y;
coors[? "x"] = end_x;
coors[? "y"] = end_y;
return(coors);