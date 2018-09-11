// For when an enemy is hit? Something like that anyway.
// Argument0 - enemy object.

var obj = argument0;
var collidedWith = argument1;

var xDir = obj.x - collidedWith.x; // need to normalize these.
var yDir = obj.y - collidedWith.y;
var dotProd = point_distance(0,0,xDir,yDir); // or use point_distance, you cheater.
xDir = xDir / dotProd; // Should result in a normalized vector.
yDir = yDir / dotProd;
			
obj.state = Object_State.HitStun;
obj.dx = xDir;
obj.dy = yDir;
	// Do some damage based on collided with obstacle.
alarm_set(0, 10); // count down from 20?
obj.myHealth -= 1; // do some damage
global.TrackedHealth = myHealth; // Make sure this is being tracked.
			
path_end(); // can no longer follow the path anyway.

