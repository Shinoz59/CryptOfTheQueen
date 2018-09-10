// arument 0 - enemy

var obj = argument0;

if(obj.state != Enemy_State.HitStun){
	// Damage Check!
	var friendlyLength = array_length_1d(global.Friendlies);
	var collissions;
	collissions[friendlyLength * 8 - 1] = 0; // allocate the full-sized array at the start.

	for (var i = 0; i < friendlyLength; i++){
		collissions[0+i] = instance_place(obj.bbox_left,  obj.bbox_top,    global.Friendlies[i]);
		collissions[1+i] = instance_place(obj.bbox_left,  obj.bbox_bottom, global.Friendlies[i]);
		collissions[2+i] = instance_place(obj.bbox_right, obj.bbox_top,    global.Friendlies[i]);
		collissions[3+i] = instance_place(obj.bbox_right, obj.bbox_bottom, global.Friendlies[i]);
		collissions[4+i] = instance_place(obj.bbox_right, obj.y,           global.Friendlies[i]);
		collissions[5+i] = instance_place(obj.bbox_left,  obj.y,           global.Friendlies[i]);
		collissions[6+i] = instance_place(obj.x,		  obj.bbox_top,    global.Friendlies[i]);
		collissions[7+i] = instance_place(obj.x,		  obj.bbox_bottom, global.Friendlies[i]);
	}

	for (var j = 0; j < array_length_1d(collissions); ++j){
		if (collissions[j] > 0){ // Above 0 are valid objects?
			var collidedWith = collissions[j]; // the object in question?  Will have to see how this works out.
			
			var xDir = obj.x - collidedWith.x; // need to normalize these.
			var yDir = obj.y - collidedWith.y;
			var dotProd = point_distance(0,0,xDir,yDir); // or use point_distance, you cheater.
			xDir = xDir / dotProd; // Should result in a normalized vector.
			yDir = yDir / dotProd;
			
			obj.state = Enemy_State.HitStun;
			obj.dx = xDir;
			obj.dy = yDir;
			 // Do some damage based on collided with obstacle.
			alarm_set(0, 20); // count down from 20?
			obj.myHealth -= 1; // do some damage
			global.TrackedHealth = myHealth; // Make sure this is being tracked.
			
			path_end(); // can no longer follow the path anyway.
			break; // Only pay attention to the first one.
		}
	}
}
