start_x = 128;
start_y = 64;

for (place_x = 0; place_x < 12; place_x++) {
	for (place_y = 0; place_y < 12; place_y++) {
		if ((place_x + place_y)%2 == 0) {
			tile = tile_red;
		} else {
			tile = tile_green;
		}
		offset_y = place_x * 16;
		instance_create_layer(start_x + (place_x * 32), start_y + (place_y * 32) + offset_y, "board", tile);
	}
}


/*
start_x = start_x + 32;
start_y = start_y + 16;

for (place_x = 0; place_x < 6; place_x++) {
	for (place_y = 0; place_y < 6; place_y++) {
		instance_create_layer(start_x + (place_x * 64), start_y + (place_y * 32), "board", tile_green);
	}
}
*/