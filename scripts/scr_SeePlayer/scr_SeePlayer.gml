// argument0 - enemy object

var obj = argument0;

var friendlyListLength = array_length_1d(global.Friendlies);
var facingx = 0;
var facingy = 0;
var friendly;
var returnInstance = noone;
var returnDistance = 0;
var friendlyCount = 0;
var friendlyInstance = noone;
var friendlyDistance = 0;
var vectorx = 0;
var vectory = 0;
var dotProd = 0;

switch(obj.facingDirection){ // figure out which way I'm facing.
	case facing_direction.North:
		facingy = -1;
		break;
	case facing_direction.West:
		facingx = -1;
		break;
	case facing_direction.South:
		facingy = 1;
		break;
	case facing_direction.East:
		facingx = 1;
		break;
}

for (var i = 0; i < friendlyListLength; ++i){ // loop through all objects listed as friendly.
	friendly = global.Friendlies[i];
	friendlyCount = instance_number(friendly); // get the number of instances of the friendly object.
	for (var j = 0; j < friendlyCount; ++j){
		friendlyInstance = instance_find(friendly, j); // get the instance.
		friendlyDistance = point_distance(obj.x, obj.y, friendlyInstance.x, friendlyInstance.y);
		if (friendlyDistance < 32 * 2){ // tile size x sight range.
			if (returnDistance == 0 || returnDistance > friendlyDistance){
				vectorx = friendlyInstance.x - obj.x; // get the vector between the two objects.
				vectory = friendlyInstance.y - obj.y;
				vectorx = vectorx / friendlyDistance; // normalize the vector?
				vectory = vectory / friendlyDistance;
				
				dotProd = dot_product(facingx,facingy,vectorx,vectory);
				
				if (dotProd > 0.5){
					returnDistance = friendlyDistance;
					returnInstance = friendlyInstance; // closest object.
				}
			}
		}
	}
}

return returnInstance;