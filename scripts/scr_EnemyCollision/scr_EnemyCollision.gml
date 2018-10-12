// arument 0 - enemy

var obj = argument0;

// Damage Check!
var friendlyLength = array_length_1d(global.Enemies);
var collissions;
var enemyList;
var enemyDistance;

enemyList[friendlyLength - 1] = noone;
collissions[friendlyLength - 1] = noone; // allocate the full-sized array at the start.

for (var i = 0; i < friendlyLength; i++){
	enemyList[i] = instance_nearest(obj.x, obj.y, global.Enemies[i]);
	collissions[i] = instance_place(obj.x, obj.y, enemyList[i]);
}

for (var j = 0; j < array_length_1d(collissions); ++j){
	if (collissions[j] > 0){ // Above 0 are valid objects?
		return collissions[j]; // To keep it more neutral.
	}
}
return pointer_null;