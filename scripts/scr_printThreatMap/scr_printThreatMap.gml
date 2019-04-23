/// scr_printThreatMap()

var width = 6;
var height = 6;
var w, h, i;

for (w = 0; w < width; w++) {
	var line = "{";
	for (h = 0; h < height; h++) {
		var tile = scr_getTileByCoor(w, h);
		var size = ds_map_size(tile.threats);
		var key = ds_map_find_first(tile.threats);
		line += string(tile.base_x) + ": " + string(tile.base_y);
		for (i = 0; i < size; i++;) {
			var threat_level = tile.threats[? key];
			
			line += "(";
			line += key;
			line += ", ";
			line += string(threat_level);
			line += ")";
			
			key = ds_map_find_next(tile.threats, key);
		}
		line += ", ";
	}
	line += "}";
	show_debug_message(line);
}