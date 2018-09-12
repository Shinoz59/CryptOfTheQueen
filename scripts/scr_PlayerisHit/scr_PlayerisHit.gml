// For when an enemy is hit? Something like that anyway.
// Argument0 - player object.
// argument1 - collided object.

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
obj.alarm[0] = 20;
//alarm_set(0, 20); // can't use because the calling object isn't the player?
// player doesn't have a path or health.
