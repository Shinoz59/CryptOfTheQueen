//Basic attack triggering
// Argument0 - enemy object.
var obj = argument0;

if (obj.path_position == 1 && obj.state != Object_State.Attacking){ // attack distance reached!
	scr_CreateAttack(obj);
	obj.state = Object_State.Attacking;
	//path_end(); // can no longer follow the path anyway.
	//obj.path_position = 1; // need to be called with path_end or stuff breaks.
	obj.attackCooldown = obj.attackCooldownMax;
	path_end();
}