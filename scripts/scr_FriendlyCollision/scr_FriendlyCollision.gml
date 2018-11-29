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
	collissions[i] = instance_place(obj.x, obj.y, friendlyList[i]);
}

for (var j = 0; j < array_length_1d(collissions); ++j){
	if (collissions[j] != noone){ // Above 0 are valid objects?
		return collissions[j]; // To keep it more neutral.
	}
}
return pointer_null;