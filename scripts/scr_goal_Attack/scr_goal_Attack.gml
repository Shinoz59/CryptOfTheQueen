// argument0 = 'enemy' object.
var obj = argument0;
var target = obj.target;
var pathValid = 1; // 0 is valid.
var cantPath = 0;

if (obj.path_position == 1 || obj.state == Object_State.Idle){ // If its at the end of the path.
	if (instance_exists(obj_goal)){
		instance_destroy(obj_goal); // huh, neat.  didn't know you could do that.
	}
	while (pathValid != 0){
		var dx = target.x - obj.x;
		var dy = target.y - obj.y; // vector from object to target.
	
		//if (obj.attackCooldown > 5){
		//	dx *= -1;
		//	dy *= -1;
		//}
	    // VERY MUCH NEEDS DEBUGGING
		var dist = point_distance(0, 0, dx, dy);
		var normx = dx / dist;
		var normy = dy / dist; // Normalized vector

		var tarx = target.x - (normx * 52);
		var tary = target.y - (normy * 52); // a point about half a tile away from the target

		var variance = random(16) - 8;
		tarx -= (normx * variance * 2);
		tary -= (normy * variance * 2); // shuffling it a bit.
		pathValid = scr_checkGoalTiles(obj, tarx, tary);
		cantPath += 1;
		
		if (cantPath > 5){ // If we can't find a path, then give up.  I'm lazy.
			obj.state = Object_State.Idle;
			return;
		}
	}
	
	scr_createGoal(obj, tarx, tary); // should work now
}
// okay so I want to target a few different squares.  Then randomly choose between 3 or so of them.
  // Have non-square goals?  As long as it fits anyway...
//
//       [e]
//    [1][2][ ]  and so on
//    [ ][ ][3]
//    [x][ ][ ]
//
//
//  Issue, if the player doesn't move, they won't get hit ever :/
//
//if (mouse_check_button_pressed(mb_left)) {
//if (obj.path_position == 1 || obj.state == Object_State.Idle){ // If its at the end of the path.
//	if(instance_exists(obj_goal)){
//		instance_destroy(obj_goal); // huh, neat.  didn't know you could do that.
//	}
//	var ypos = random(8) - 4; // should be between -3 and 3, possibly 4.
//	var xpos = random(8) - 4;
//	var objx = floor(obj.x) - floor(obj.x) % 32 + 16;
//	var objy = floor(obj.y) - floor(obj.y) % 32 + 16;
//	ypos = floor(ypos) * 32; // scale it to the size of the grid.
//	xpos = floor(xpos) * 32;
//	xpos += objx; // Need some kind of snapping to grid here, otherwise it'll slowly drift off of the grid.
//	ypos += objy;
	
//	scr_createGoal(obj, xpos, ypos);
//}
//}