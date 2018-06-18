// argument0 - Player object/id

var player = argument0;


	if (player.dy > 0){
		  // Gets the collision info at the bottom left + right corner.
		var t1 = tilemap_get_at_pixel(player.tilemap, player.bbox_left, player.bbox_bottom) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(player.tilemap, player.bbox_right, player.bbox_bottom) & tile_index_mask;

		if (t1 != 0 || t2 != 0){ // All tiles are considered for collision.
			  // snaps the sprite back to right above the tileset.
			player.y = ((player.bbox_bottom & ~(player.sprite_height-1)) - 1) - player.sprite_bbox_bottom;
		}
	
	}else if (player.dy < 0){
		  // Gets the collision info at the top left + right corner.
		var t1 = tilemap_get_at_pixel(player.tilemap, player.bbox_left, player.bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(player.tilemap, player.bbox_right, player.bbox_top) & tile_index_mask;

		if (t1 != 0 || t2 != 0){
			  // snaps the sprite back to right below the tileset.
			player.y = ((player.bbox_top + player.sprite_height) & ~(player.sprite_height-1)) - player.sprite_bbox_top;
		}
	}
	
	if (player.dx > 0){ // moving rightwards
			// Gets the collision info at the bottom left + right corner.
		var t1 = tilemap_get_at_pixel(player.tilemap, player.bbox_right, player.bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(player.tilemap, player.bbox_right, player.bbox_bottom) & tile_index_mask;

		if (t1 != 0 || t2 != 0){
				// snaps the sprite back to the left of the tileset.
			player.x = ((player.bbox_right & ~(player.sprite_width-1)) - 1) - player.sprite_bbox_right;
		}
	
	}else if (player.dx < 0){ // moving leftwards
			// Gets the collision info at the top left + right corner.
		var t1 = tilemap_get_at_pixel(player.tilemap, player.bbox_left, player.bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(player.tilemap, player.bbox_left, player.bbox_bottom) & tile_index_mask;

		if (t1 != 0 || t2 != 0){
				// snaps the sprite back to right below the tileset.
			player.x = ((player.bbox_left + player.sprite_width) & ~(player.sprite_width-1)) - sprite_bbox_left;
		}
	}
