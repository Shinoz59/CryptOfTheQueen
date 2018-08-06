/// @description Insert description here
// You can write your code in this editor


// turn sprite to face the direction they are walking.
// need to adjust this later to make sure it doesn't flip a bunch.
if (direction >= 306 || direction <= 45){ // using a 90 degree chunk rotated 45 degrees to get a good look.
	image_angle = 0;
}
else if (direction >= 46 && direction <= 135){
	image_angle = 90;
}
else if (direction >= 136 && direction <= 225){
	image_angle = 180;
}
else if (direction >= 226 && direction <= 305){
	image_angle = 270;
}

// I want knockback now.

scr_EnemyCollision(id);

if (state == Enemy_State.HitStun){
	x += dx * bounceSpeed;
	y += dy * bounceSpeed;
	if (scr_TileCollission(id) == 1){ // bounce off of stuff 'cause its funny.
		dx *= -1;
		dy *= -1;
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

if (state == Enemy_State.Idle || state == Enemy_State.Exploring){
	scr_goal_random(id);
}
