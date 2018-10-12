// arument 0 - enemy

var obj = argument0;

// Damage Check!
var friendlyLength = array_length_1d(global.Friendlies);
var collissions;
var friendlyList;
var friendlyDistance;
collissions[friendlyLength] = noone; // allocate the full-sized array at the start.
friendlyList[friendlyLength - 1] = noone;

for (var i = 0; i < friendlyLength; i++){
	friendlyList[i] = instance_nearest(obj.x, obj.y, global.Friendlies[i]);
	//friendlyDistance = point_distance(obj.x, obj.y, friendlyList[i].x, friendlyList[i].y); // or use point_distance, you cheater.
	//if (friendlyDistance < 64){ // don't bother if the object is too far away anyway.
	collissions[i] = instance_place(obj.x, obj.y, friendlyList[i]);
		//collissions[0+i] = instance_place(obj.bbox_left,  obj.bbox_top,    friendlyList[i]);
		//collissions[1+i] = instance_place(obj.bbox_left,  obj.bbox_bottom, friendlyList[i]);
		//collissions[2+i] = instance_place(obj.bbox_right, obj.bbox_top,    friendlyList[i]);
		//collissions[3+i] = instance_place(obj.bbox_right, obj.bbox_bottom, friendlyList[i]);
		//collissions[4+i] = instance_place(obj.bbox_right, obj.y,           friendlyList[i]);
		//collissions[5+i] = instance_place(obj.bbox_left,  obj.y,           friendlyList[i]);
		//collissions[6+i] = instance_place(obj.x,		  obj.bbox_top,    friendlyList[i]);
		//collissions[7+i] = instance_place(obj.x,		  obj.bbox_bottom, friendlyList[i]);
	//}
	//else{ // no function to fill with 0's?  kinda weird.
	//	collissions[0+i] = noone;
	//	collissions[1+i] = noone;
	//	collissions[2+i] = noone;
	//	collissions[3+i] = noone;
	//	collissions[4+i] = noone;
	//	collissions[5+i] = noone;
	//	collissions[6+i] = noone;
	//	collissions[7+i] = noone;
	//}
}

for (var j = 0; j < array_length_1d(collissions); ++j){
	if (collissions[j] != noone){ // Above 0 are valid objects?
		return collissions[j]; // To keep it more neutral.
	}
}
return pointer_null;