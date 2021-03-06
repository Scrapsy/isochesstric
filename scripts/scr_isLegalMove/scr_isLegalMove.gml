/// scr_isLegalMove(to_x, to_y, inst)
// the legal moves must return a map with applicable status.
// status object keys:
/*
	status: clear - It is possible to move and there is nothing on the new tile
	status: illegal - It is an illegal move and is not recommended to move to
	status: taken - Signifies a legal move where an enemy piece would be taken
	status: deselect - the original coordinates have been selected and nothing should happen
	current_tile: tile_instance_id - The tile (not required for illegal moves)
									Tile needs to forget the piece
									the piece needs to be removed
*/
var to_x, to_y, inst;
to_x = argument0;
to_y = argument1;
inst = argument2;
with(inst) {
	if (self.base_x == to_x && self.base_y == to_y) {
		show_debug_message("That piece is already here.");
		var status = ds_map_create();
		status[? "status"] = "deselect";
		return status;
	}
	if(self.has_moved) {
		show_debug_message("That's weird, That piece has already moved!");
		var status = ds_map_create();
		status[? "status"] = "illegal";
		return status;
	}
	if(self.type == "pawn") {
		return scr_isLegalMoveForPawn(to_x, to_y, inst);
	}
	show_debug_message("That piece doesn't have a recognized type? " + self.type);
	var status = ds_map_create();
	status[? "status"] = "illegal";
	return status;
}