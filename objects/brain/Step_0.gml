/// @description AI logic handler
time++;

if (memory_instance.current_player[1] != "player") {
	if (time == frequency) {
		var pieces = scr_getMovablePieces(memory_instance.current_player[0]);
		if (array_length_1d(pieces) != 0) {
			with(pieces[0]) {
				self.has_moved = true;
			}
			scr_turnEnd();
		}
	}
}

if (time == frequency) {
	time = 0;
}