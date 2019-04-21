/// scr_getMovablePieces(team)
var team = argument0;
var pieces = [];

var i;
for (i = 0; i < instance_number(base_piece); i += 1) {
	var piece = instance_find(base_piece, i);
	if (piece.team == team && !piece.has_moved && !piece.has_died) {
		pieces[array_length_1d(pieces)] = piece;
	}
}

return pieces;