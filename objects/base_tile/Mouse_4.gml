/// @description Select and Move pieces
show_debug_message("x: " + string(base_x) + ", y: " + string(base_y));
show_debug_message("Piece: " + string(current_piece));
var this_x = x;
var this_y = y;
with (memory_instance) {
	if (self.selected_piece == noone and other.current_piece != noone) {
		show_debug_message("Selected piece: " + string(other.current_piece));
		self.selected_piece = other.current_piece;
		other.current_piece = noone;
	} else if (self.selected_piece != noone and other.current_piece == noone) {
		show_debug_message("Moving piece to location");
		with(self.selected_piece) {
			self.x = this_x;
			self.y = this_y;
		}
		other.current_piece = self.selected_piece;
		self.selected_piece = noone;
	} else {
		show_debug_message("Unknown Action");
	}
}