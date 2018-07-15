// argument 0 = grid.

var grid = argument0;

var i;
var j;

var max_x = grid.grid_cell_count_x * grid.grid_size_x + grid.grid_start_x;
var max_y = grid.grid_cell_count_y * grid.grid_size_y + grid.grid_start_y;
var tilemap = layer_tilemap_get_id("Tiles_1"); // change later probably.
var visionmap = layer_tilemap_get_id("Tiles_2"); // same.

for(i = grid.grid_start_x + 16; i < max_x; i += 32){
	for(j = grid.grid_start_y + 16; j < max_y; j += 32){
		var t1 = tilemap_get_at_pixel(tilemap, i, j) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(visionmap, i, j) & tile_index_mask;
		
		if (t1 == 2 || t1 == 1 || t2 == 1){ // only count the walls/pillars
			draw_rectangle(i - 15, j - 15, i + 15, j + 15, true); // less than 16 because we want it to fit inside the box.
		}
	}
}