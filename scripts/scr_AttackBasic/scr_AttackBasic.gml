//Basic attack triggering
// Argument0 - enemy object.
var obj = Argument0;

if (obj.attackCooldown >= 0){
	obj.attackCooldown -= 1; // replace with a time dt or something
}
else{
	
	
	obj.attackCooldown = obj.attackCooldownMax;
}