//Basic attack triggering
// Argument0 - enemy object.
var obj = argument0;

if (obj.attackCooldown >= 0){
	obj.attackCooldown -= 1; // replace with a time dt or something
}
else{
	scr_CreateAttack(obj);
	obj.state = Object_State.Attacking;
	path_end(); // can no longer follow the path anyway.
	obj.path_position = 1; // need to be called with path_end or stuff breaks.
	obj.attackCooldown = obj.attackCooldownMax;
}