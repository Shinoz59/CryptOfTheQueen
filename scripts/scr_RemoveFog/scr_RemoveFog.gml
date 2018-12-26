// Argument0 = object.

var obj = argument0;

// maybe pull from a vision stat or something?

var maptiles = layer_tilemap_get_id("CollisionTiles");
var objx = floor(obj.x) - floor(obj.x) % 32 + 16; // Recenters the x/y so that the pathing map won't be broken.
var objy = floor(obj.y) - floor(obj.y) % 32 + 16;
var maxX = objx + 96; // 3-tile vision currently
var maxY = objy + 96;

for (var i = objx - 96; i <= maxX; i += 32){
	for (var j = objy - 96; j <= maxY; j += 32){
		if( i > 0 && j > 0){
			var shouldChange = tilemap_get_at_pixel(obj.fogTilemap, i, j) & tile_index_mask;
			if (shouldChange > 0){
				tilemap_set_at_pixel(obj.fogTilemap, 2, i, j);
				var existingObstacle = tilemap_get_at_pixel(maptiles, i, j) & tile_index_mask;
				if (existingObstacle != 2 && existingObstacle != 1){ // only count the walls/pillars
					mp_grid_clear_rectangle(myGrid, i - 15, j - 15, i, j); // clear out the grid tile?
				}
				if (existingObstacle == 3){
					mp_grid_clear_rectangle(myGrid, i - 15, j - 15, i, j); // clear out the grid tile?
					obj.goal_found = true;
					obj.goal_x = i;
					obj.goal_y = j;
				}
			}
		}
	}
}