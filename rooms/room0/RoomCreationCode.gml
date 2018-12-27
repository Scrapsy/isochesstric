var size_x, size_y, place_x, place_y, tile, coors;
size_x = 12;
size_y = 12;

for (place_x = 0; place_x < size_x; place_x++) {
	for (place_y = 0; place_y < size_y; place_y++) {
		if ((place_x + place_y)%2 == 0) {
			tile = tile_red;
		} else {
			tile = tile_green;
		}
		coors = scr_getCoor(place_x, place_y);
		instance_create_layer(coors[? "x"], coors[? "y"], "board", tile);
	}
}