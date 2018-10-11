// argument0 = 'enemy' object.
var obj = argument0;

if(obj.path_position == 1 || obj.state == Object_State.Idle){ // If its at the end of the path.
	var distance = point_distance(obj.x, obj.y, obj.goal_x, obj.goal_y);
	
	if(instance_exists(obj_goal)){
		instance_destroy(obj_goal); // huh, neat.  didn't know you could do that.
	}
	if (distance < 128 ){ // If its close enough, just go straight there.
		scr_createGoal(obj, obj.goal_x, obj.goal_y);	
	}
	else{
		var objx = floor(obj.x) - floor(obj.x) % 32 + 16;
		var objy = floor(obj.y) - floor(obj.y) % 32 + 16;
		var dx = obj.goal_x - objx;
		var dy = obj.goal_y - objy;
		var goalx = objx;
		var goaly = objy;
		var yVar = random(4) - 2;
		var xVar = random(4) - 2;
		
		if (abs(dx) > abs(dy)){ // move 3 squares straight to the goal, along the larger axis.
			if (dx > 0)
				objx += 32 * 3;
			else
				objx -= 32 * 3;
		}
		else{
			if (dy > 0)
				objy += 32 * 3;
			else
				objy -= 32 * 3;
		}
		
		// move it randomly up to 1 tile in either direction.
		objx += floor(xVar) * 32;
		objy += floor(yVar) * 32;
	
		scr_createGoal(obj, objx, objy);	
	}
}
//}