/// scr_resetMovability(team)

var team = argument0;
var i;
for (i = 0; i < instance_number(base_piece); i += 1) {
	var piece = instance_find(base_piece, i);
	if (piece.team == team && !piece.has_moved) {
		piece.has_moved = false;
	}
}