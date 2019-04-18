var size_x, size_y, place_x, place_y, tile, coors, inst;
size_x = 6;
size_y = 6;

for (place_x = 0; place_x < size_x; place_x++) {
	for (place_y = 0; place_y < size_y; place_y++) {
		if ((place_x + place_y)%2 == 0) {
			tile = tile_red;
		} else {
			tile = tile_green;
		}
		coors = scr_getCoor(place_x, place_y);
		inst = instance_create_layer(coors[? "x"], coors[? "y"], "board", tile);
		with(inst) {
			self.base_x = place_x;
			self.base_y = place_y;
		}
	}
}

var stage_1;
stage_1 = [
	[piece_pawn_purple, 1, 1, "south"],
	[piece_pawn_purple, 2, 1, "south"],
	[piece_pawn_purple, 3, 1, "south"],
	[piece_pawn_purple, 4, 1, "south"],
	[piece_pawn_yellow, 1, 4, "north"],
	[piece_pawn_yellow, 2, 4, "north"],
	[piece_pawn_yellow, 3, 4, "north"],
	[piece_pawn_yellow, 4, 4, "north"]
];

for (var i = 0; i < array_length_1d(stage_1); i++) {
	var piece;
	piece = stage_1[i];
	coors = scr_getCoor(piece[1], piece[2]);
	inst = instance_create_layer(coors[? "x"], coors[? "y"], "pieces", piece[0]);
	with(inst) {
		self.base_x = piece[1];
		self.base_y = piece[2];
		self.facing = piece[3];
	}
	var tile = instance_nearest(coors[? "x"], coors[? "y"], base_tile);
	with(tile) {
		self.current_piece = inst;
	}
}