/// scr_calculateThreatPawn(piece, is_addition)

var piece = argument0;
var is_addition = argument1;
var threat = piece.threat;
var tile;
if (not is_addition) {
	threat = -piece.threat;
}

//TODO: Add all facings
if (piece.facing == "north") {
	tile = scr_getTileByCoor(piece.base_x + 1, piece.base_y - 1);
	scr_addThreatToTile(tile, piece.team, threat);
	tile = scr_getTileByCoor(piece.base_x - 1, piece.base_y - 1);
	scr_addThreatToTile(tile, piece.team, threat);
} else if (piece.facing == "south") {
	tile = scr_getTileByCoor(piece.base_x + 1, piece.base_y + 1);
	scr_addThreatToTile(tile, piece.team, threat);
	tile = scr_getTileByCoor(piece.base_x - 1, piece.base_y + 1);
	scr_addThreatToTile(tile, piece.team, threat);
} else {
	show_debug_message("Unknown pawn threat facing: " + piece.facing);
}