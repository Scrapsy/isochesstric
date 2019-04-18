/// scr_getTileByCoor(at_x, at_y)
var at_x, at_y, found_instance;
at_x = argument0;
at_y = argument1;
found_instance = noone;
for (var i = 0; i < instance_number(base_tile); ++i)
{
	var instance = instance_find(base_tile, i);
	with(instance) {
		if (self.base_x == at_x and self.base_y = at_y) {
			found_instance = instance;
			break;
		}
	}
}
return found_instance;