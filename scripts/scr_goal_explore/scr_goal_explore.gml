// argument0 = 'enemy' object.
var obj = argument0;

var movingX = 0;
var movingY = 0;
var multiplier = 32;
var maptiles = layer_tilemap_get_id("CollisionTiles");

//if (mouse_check_button_pressed(mb_left)) {
if (obj.path_position == 1 || obj.state == Object_State.Idle){ // If its at the end of the path.
	if (instance_exists(obj_goal)){
		instance_destroy(obj_goal); // huh, neat.  didn't know you could do that.
	}
	
	var objx = floor(obj.x) - floor(obj.x) % 32 + 16;
	var objy = floor(obj.y) - floor(obj.y) % 32 + 16;
	var shrouded = tilemap_get_at_pixel(obj.fogTilemap, objx, objy) & tile_index_mask;
	var existingObstacle = tilemap_get_at_pixel(maptiles, objx, objy) & tile_index_mask;
	
	var djikstraX = ds_queue_create();
	var djikstraY = ds_queue_create();
	var topChecked = objy;
	var leftChecked = objx;
	var i = 0;
	
	movingX = leftChecked;
	movingY = topChecked;
	
	while (shrouded != 1){
		
		 // Sets up the Queue for the checking.
		topChecked -= 32;
		leftChecked -= 32;
		multiplier += 32 * 2 // increase the 'edge' I'm checking by 2 tiles.
		
		movingX = leftChecked;
		movingY = topChecked;
		
		for (i = 0; i < multiplier; i += 32){
			if (movingX >= 0 && movingY >= 0){ // negative values are off the map, and aren't valid
				ds_queue_enqueue(djikstraX, movingX);
				ds_queue_enqueue(djikstraY, movingY);
			}
			movingX += 32;
		}
		
		movingX -= 32; // put it back at the last added tile.
		movingY += 32; // scoot it down a tile.
		for (i = 32; i < multiplier; i += 32){
			if (movingX >= 0 && movingY >= 0){
				ds_queue_enqueue(djikstraX, movingX);
				ds_queue_enqueue(djikstraY, movingY);
			}
			movingY += 32;
		}
		
		movingY -= 32;
		movingX -= 32;
		for (i = 32; i < multiplier; i += 32){
			if (movingX >= 0 && movingY >= 0){
				ds_queue_enqueue(djikstraX, movingX);
				ds_queue_enqueue(djikstraY, movingY);
			}
			movingX -= 32;
		}
		
		movingX += 32;
		movingY -= 32;
		for (i = 32; i < multiplier - 32; i += 32){ // Has to go one less, since that corner is already checked.
			if (movingX >= 0 && movingY >= 0){
				ds_queue_enqueue(djikstraX, movingX);
				ds_queue_enqueue(djikstraY, movingY);
			}
			movingY -= 32;
		}
		
		// dequeue the bits
		while (!ds_queue_empty(djikstraX)){
			movingX = ds_queue_dequeue(djikstraX);
			movingY = ds_queue_dequeue(djikstraY);
		
			shrouded = tilemap_get_at_pixel(obj.fogTilemap, movingX, movingY) & tile_index_mask;
			existingObstacle = tilemap_get_at_pixel(maptiles, movingX, movingY) & tile_index_mask;
			if (shrouded == 1 && existingObstacle != 2 && existingObstacle != 1) // only count the walls/pillars
				break;
		}
		if (shrouded == 1 && existingObstacle != 2 && existingObstacle != 1) // only count the walls/pillars
			break;
	}
	ds_queue_destroy(djikstraX);
	ds_queue_destroy(djikstraY);
	
	var vecX = movingX - objx;
	var vecY = movingY - objy;
	
	var dist = point_distance(objx, objy, movingX, movingY);
	if (dist > 32){ // make sure not to divide by zero...
		vecX /= dist;
		vecY /= dist;
	
		existingObstacle = tilemap_get_at_pixel(maptiles, movingX, movingY) & tile_index_mask;
		do { // huh, do, while loops look weird in GM2
				 // Scooch it a tile closer?
			if (vecX >= 0.5)
				movingX -= 32;
			else if (vecX <= -0.5)
				movingX += 32;
			if (vecY >= 0.5)
				movingY -= 32;
			else if(vecY <= -0.5)
				movingY += 32;
		}
		until (existingObstacle != 2 && existingObstacle != 1);
	}
	
	scr_createGoal(obj, movingX, movingY);
}
//}