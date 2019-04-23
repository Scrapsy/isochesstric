/// scr_addThreatToTile(tile, team, threat)

var tile = argument0;
var team = argument1;
var threat = argument2;

var old_threat = tile.threats[? team];
if (is_undefined(old_threat)) {
	tile.threats[? team] = threat;
} else {
	tile.threats[? team] = threat + tile.threats[? team];
}