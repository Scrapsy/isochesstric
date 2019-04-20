/// @description Select and Move pieces
show_debug_message("x: " + string(base_x) + ", y: " + string(base_y));
show_debug_message("Piece: " + string(current_piece));
var this_x = x;
var this_y = y;
var tile_base_x = base_x;
var tile_base_y = base_y;

// TODO: Should add graphics, groundmarkers, animations
with (memory_instance) {
	if (self.selected_piece == noone and other.current_piece != noone) {
		if (other.current_piece.has_moved) {
			show_debug_message("This piece has already moved.");
		} else {
			show_debug_message("Selected piece: " + string(other.current_piece));
			self.selected_piece = other.current_piece;
			other.current_piece = noone;
		}
	} else if (self.selected_piece != noone) {
		var status = scr_isLegalMove(tile_base_x, tile_base_y, self.selected_piece);
		show_debug_message("Status: " + status[? "status"]);
		if (status[? "status"] == "clear") {
			show_debug_message("Is Legal move, fine to go");
			with(self.selected_piece) {
				self.x = this_x;
				self.y = this_y;
				self.base_x = tile_base_x;
				self.base_y = tile_base_y;
				self.has_moved = true;
			}
			other.current_piece = self.selected_piece;
			self.selected_piece = noone;
		} else if (status[? "status"] == "taken") {
			show_debug_message("Is Legal move, killing someone at: " + string(status[? "current_tile"]));
			// TODO: Check if this is the last piece removed
			with(other.current_piece) {
				//TODO: Do better death handling
				self.x = 10;
				self.y = 10;
				self.base_x = 10;
				self.base_y = 10;
				self.has_died = true;
			}
			other.current_piece = noone;
			
			with(self.selected_piece) {
				self.x = this_x;
				self.y = this_y;
				self.base_x = tile_base_x;
				self.base_y = tile_base_y;
				self.has_moved = true;
			}
			other.current_piece = self.selected_piece;
			self.selected_piece = noone;
		} else if (status[? "status"] == "deselect") {
			show_debug_message("Deselected");
			other.current_piece = self.selected_piece;
			self.selected_piece = noone;
		} else {
			show_debug_message("Is not Legal move");
		}
	} else {
		show_debug_message("Unknown Action");
	}
}