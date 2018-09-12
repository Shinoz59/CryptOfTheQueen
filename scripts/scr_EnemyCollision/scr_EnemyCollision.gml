// arument 0 - enemy

var obj = argument0;

// Damage Check!
var friendlyLength = array_length_1d(global.Enemies);
var collissions;
var enemyList;
var enemyDistance;

enemyList[friendlyLength - 1] = 0;
collissions[friendlyLength * 8 - 1] = 0; // allocate the full-sized array at the start.

for (var i = 0; i < friendlyLength; i++){
	enemyList[i] = instance_nearest(obj.x, obj.y, global.Friendlies[i]);
	enemyDistance = point_distance(obj.x, obj.y, enemyList[i].x, enemyList[i].y); // or use point_distance, you cheater.
	if (enemyDistance < 64){ // Don't bother if they're too far away anyway.
		collissions[0+i] = instance_place(obj.bbox_left,  obj.bbox_top,    enemyList[i]);
		collissions[1+i] = instance_place(obj.bbox_left,  obj.bbox_bottom, enemyList[i]);
		collissions[2+i] = instance_place(obj.bbox_right, obj.bbox_top,    enemyList[i]);
		collissions[3+i] = instance_place(obj.bbox_right, obj.bbox_bottom, enemyList[i]);
		collissions[4+i] = instance_place(obj.bbox_right, obj.y,           enemyList[i]);
		collissions[5+i] = instance_place(obj.bbox_left,  obj.y,           enemyList[i]);
		collissions[6+i] = instance_place(obj.x,		  obj.bbox_top,    enemyList[i]);
		collissions[7+i] = instance_place(obj.x,		  obj.bbox_bottom, enemyList[i]);
	}
	else{ // no function to fill with 0's?  kinda weird.
		collissions[0+i] = 0;
		collissions[1+i] = 0;
		collissions[2+i] = 0;
		collissions[3+i] = 0;
		collissions[4+i] = 0;
		collissions[5+i] = 0;
		collissions[6+i] = 0;
		collissions[7+i] = 0;
	}
}

for (var j = 0; j < array_length_1d(collissions); ++j){
	if (collissions[j] > 0){ // Above 0 are valid objects?
		return collissions[j]; // To keep it more neutral.
	}
}
return pointer_null;