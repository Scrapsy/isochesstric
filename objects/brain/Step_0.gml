/// @description Insert description here
// You can write your code in this editor
time++;

if (memory_instance.current_player[1] != "player") {
	if (time == frequency) {
		var pieces = scr_getMovablePieces(memory_instance.current_player[0]);
		if (array_length_1d(pieces) != 0) {
			with(pieces[0]) {
				self.has_moved = true;
			}
		}
	}
}

if (time == frequency) {
	time = 0;
}