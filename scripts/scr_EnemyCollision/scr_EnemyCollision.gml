// arument 0 - enemy

var obj = argument0;

// Damage Check!
var friendlyLength = array_length_1d(global.Enemies);
var collissions;
collissions[friendlyLength * 8 - 1] = 0; // allocate the full-sized array at the start.

for (var i = 0; i < friendlyLength; i++){
	collissions[0+i] = instance_place(obj.bbox_left,  obj.bbox_top,    global.Enemies[i]);
	collissions[1+i] = instance_place(obj.bbox_left,  obj.bbox_bottom, global.Enemies[i]);
	collissions[2+i] = instance_place(obj.bbox_right, obj.bbox_top,    global.Enemies[i]);
	collissions[3+i] = instance_place(obj.bbox_right, obj.bbox_bottom, global.Enemies[i]);
	collissions[4+i] = instance_place(obj.bbox_right, obj.y,           global.Enemies[i]);
	collissions[5+i] = instance_place(obj.bbox_left,  obj.y,           global.Enemies[i]);
	collissions[6+i] = instance_place(obj.x,		  obj.bbox_top,    global.Enemies[i]);
	collissions[7+i] = instance_place(obj.x,		  obj.bbox_bottom, global.Enemies[i]);
}

for (var j = 0; j < array_length_1d(collissions); ++j){
	if (collissions[j] > 0){ // Above 0 are valid objects?
		return collissions[j]; // To keep it more neutral.
	}
}
return pointer_null;