// The player charges 'forward'
// argument0 - player object
// argument1 - frame count?

var player = argument0;
var time = argument1;

var chargeSpeed = 8 - (time - 5) * (time - 5) / 8;
chargeSpeed = floor(chargeSpeed) + 1;
player.dx = 0;
player.dy = 0;
if(chargeSpeed <= -2){ // works for now, look for a better solution really.
	player.state = Object_State.Idle;	
}
else{
	 // Movement code.  Probably too weird at the moment, but it works.
	if (player.facingDirection = facing_direction.East) 
		player.dx += chargeSpeed;
	else if (player.facingDirection = facing_direction.North) 
		player.dy -= chargeSpeed;
	else if (player.facingDirection = facing_direction.West) 
		player.dx -= chargeSpeed;
	else if (player.facingDirection = facing_direction.South) 
		player.dy += chargeSpeed;
}

player.x += player.dx;
player.y += player.dy;