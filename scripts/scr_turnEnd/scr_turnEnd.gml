/// scr_turnEnd()
/*
	Will check if the turn has ended and if it has, move to the next in order.
	
	Returns true if turn has ended, otherwise false
*/

var movablePieces = scr_getMovablePieces(memory_instance.current_player[0]);

scr_printThreatMap();
if (array_length_1d(movablePieces) == 0) {
	show_debug_message("Last piece has been moved!");
	memory_instance.current_team++;
	if (memory_instance.current_team == array_length_1d(memory_instance.teams)) {
		memory_instance.current_team = 0;
	}
	var new_team = memory_instance.teams[memory_instance.current_team];
	show_debug_message("New team:");
	show_debug_message(new_team);
	scr_resetMovability(new_team[0]);
	memory_instance.current_player = new_team;
	return true;
}
return false;