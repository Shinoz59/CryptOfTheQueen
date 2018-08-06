// Argument0 = object.

var obj = argument0;

// maybe pull from a vision stat or something?

var maxX = obj.x + 64;
var maxY = obj.y + 64;
var maptiles = layer_tilemap_get_id("Tiles_1");

for (var i = obj.x - 64; i <= maxX; i += 32){
	for (var j = obj.y - 64; j <= maxY; j += 32){
		if( i > 0 && j > 0){
			var shouldChange = tilemap_get_at_pixel(obj.fogTilemap, i, j) & tile_index_mask;
			if (shouldChange > 0){
				tilemap_set_at_pixel(obj.fogTilemap, 2, i, j);
				var existingObstacle = tilemap_get_at_pixel(maptiles, i, j) & tile_index_mask;
				if (existingObstacle != 2 && existingObstacle != 1){ // only count the walls/pillars
					mp_grid_clear_rectangle(myGrid, i - 15, j - 15, i, j); // clear out the grid tile?
				}
			}
		}
	}
}