/// @description Insert description here
// You can write your code in this editor


// turn sprite to face the direction they are walking.
// need to adjust this later to make sure it doesn't flip a bunch.
if (direction >= 306 || direction <= 45){ // using a 90 degree chunk rotated 45 degrees to get a good look.
	image_angle = 0;
	facingDirection = facing_direction.East; // facing direction is for attack spawning
}
else if (direction >= 46 && direction <= 135){
	image_angle = 90;
	facingDirection = facing_direction.North;
}
else if (direction >= 136 && direction <= 225){
	image_angle = 180;
	facingDirection = facing_direction.West;
}
else if (direction >= 226 && direction <= 305){
	image_angle = 270;
	facingDirection = facing_direction.South;
}

// I want knockback now.

if (state != Object_State.HitStun && invincible == false){
	var collidedWith = scr_FriendlyCollision(id);
	if (collidedWith != pointer_null)
		scr_EnemyisHit(id, collidedWith);
	scr_AttackBasic(id);
}
else{
	if(myHealth <= 0) // current end condition.
		room = room_EndScreen;
	x += dx * bounceSpeed;
	y += dy * bounceSpeed;
	if (scr_TileCollission(id) == 1){ // bounce off of stuff 'cause its funny.
		dx *= -1;
		dy *= -1;
	}
}

if (invincible == true){ // code to make them flash.  Replace with a shader maybe?
	if (invinicble_flash > 2)
		visible = false;
	else
		visible = true;
	invinicble_flash += 1;
	if (invinicble_flash > 5)
		invinicble_flash = 0;
}
else
	visible = true;

if (target == noone){
	var sighted = scr_SeePlayer(id);
	if(sighted != noone){
		target = sighted;
		path_end(); // stop if you see the player
		path_position = 1;
		scr_goal_Attack(id);
	}
}
else{
	if (distance_to_object(target) > 32 * 3){
		path_end();
		path_position = 1;
		target = noone;
	}
}
// Okay so if collission with player or attack hitbox thingy.
// end the path
// take 'damage'
// set speed back i dunno 2 squares?
// stop if you hit a wall.
// resume pathing once done.

// OKAY, testing goal stuff.

// Need to select from between available goals for the character.
// for now though,

if (state == Object_State.Idle || state == Object_State.Exploring){
	if (target == noone)
		scr_goal_random(id);
	else
		scr_goal_Attack(id);
}
