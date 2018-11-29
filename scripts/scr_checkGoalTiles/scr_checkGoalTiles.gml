// argument0 - Player object/id
// argument1 - X position to check.
// argument2 - Y position to check.
// Will return 0 if no hit, 1 if hit.

var player = argument0;
var checkX = argument1;
var checkY = argument2;

var top    = checkY - 16;
var bottom = checkY + 16; // Might be backwards, but it doesn't really matter.
var left   = checkX - 16;
var right  = checkX + 16;

var t1 = tilemap_get_at_pixel(player.tilemap, left,   bottom) & tile_index_mask;
var t2 = tilemap_get_at_pixel(player.tilemap, right,  bottom) & tile_index_mask;
var t3 = tilemap_get_at_pixel(player.tilemap, left,   top)    & tile_index_mask;
var t4 = tilemap_get_at_pixel(player.tilemap, right,  top)    & tile_index_mask;
var t5 = tilemap_get_at_pixel(player.tilemap, checkX, top)    & tile_index_mask;
var t6 = tilemap_get_at_pixel(player.tilemap, checkX, bottom) & tile_index_mask;
var t7 = tilemap_get_at_pixel(player.tilemap, checkX, checkY) & tile_index_mask;
var t8 = tilemap_get_at_pixel(player.tilemap, left,   checkY) & tile_index_mask;
var t9 = tilemap_get_at_pixel(player.tilemap, right,  checkY) & tile_index_mask;
	
return t1 + t2 + t3 + t4 + t5 + t6 + t7 + t8 + t9; // If any of these are non-zero, then it'll be a failure.