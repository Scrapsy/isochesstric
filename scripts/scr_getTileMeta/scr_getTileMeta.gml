/// scr_getTileMeta(instance)
var instance, has_piece, piece_instance, piece_facing, piece_team, piece_type, meta = noone;
instance = argument0;
meta = ds_map_create();
with(instance) {
	if (self.current_piece != noone) {
		has_piece = true;
		piece_instance = self.current_piece;
		with(self.current_piece) {
			piece_team = self.team;
			piece_type = self.type;
			piece_facing = self.facing;
		}
	} else {
		has_piece = false;
	}
	meta[? "has_piece"] = has_piece;
	if (has_piece) {
		meta[? "current_piece"] = piece_instance;
		meta[? "team"] = piece_team;
		meta[? "facing"] = piece_facing;
		meta[? "type"] = piece_type;
	}
	return meta;
}