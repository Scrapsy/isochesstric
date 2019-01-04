/// scr_isLegalMoveForPawn(to_x, to_y, inst)
var to_x, to_y, inst, tile_instance, tile_meta, status;
to_x = argument0;
to_y = argument1;
inst = argument2;
tile_instance = scr_getTileByCoor(to_x, to_y);
tile_meta = scr_getTileMeta(tile_instance);
status = ds_map_create();
status[? "status"] = "illegal";
with(inst) {
	var rel_x = self.base_x - to_x;
	var rel_y = self.base_y - to_y;
	show_debug_message("My location x: " + string(self.base_x) + ", y: " + string(self.base_y) );
	show_debug_message("Going to x: " + string(to_x) + ", y: " + string(to_y));
	show_debug_message("Relative relation x: " + string(rel_x) + ", y: " + string(rel_y));
	switch(self.facing) {
		case "north":
			// TODO: Add consideration for after first move
			if (0 <= rel_y and rel_y <= 2) {
				if (rel_x == 0 and not tile_meta[? "has_piece"]) {
					if (rel_y == 2) {
						tile_instance = scr_getTileByCoor(to_x, to_y - 1);
						tile_meta = scr_getTileMeta(tile_instance);
						if (tile_meta[? "has_piece"]) {
							status[? "status"] = "clear";
						}
					} else {
						status[? "status"] = "clear";
					}
				} else if (rel_y == 1 and (rel_x == 1 or rel_x == -1) ) {
					if (tile_meta[? "has_piece"] and tile_meta[? "team"] != self.team) {
						status[? "status"] = "taken";
						status[? "current_tile"] = tile_instance;
					}
				}
			}
			break
		default:
			show_debug_message("Unknown facing");
	}
	return status;
}