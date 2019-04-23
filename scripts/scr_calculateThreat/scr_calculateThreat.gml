/// scr_calculateThreat(piece, is_addition)
/*
	Adds or substracts the threat value that the piece represents to each tile.
*/

var piece = argument0;
var is_addition = argument1;

if (piece.type == "pawn") {
	scr_calculateThreatPawn(piece, is_addition);
} else {
	show_debug_message("Calculating unknown type: " + piece.type);
}