/// @description Insert description here
// You can write your code in this editor
var collidedWith;
// Collission detection with the enemy objects?  Would be easier here than on the enemies themselves.
if (team == 0){ // enemy team
	collidedWith = scr_EnemyCollision(id);
	if (collidedWith != pointer_null)
		scr_PlayerisHit(collidedWith, id);
}
else if (team == 1){ // friendly team.
	collidedWith = scr_FriendlyCollision(id);
	if (collidedWith != pointer_null)
		scr_EnemyisHit(collidedWith, id);
} // could probably make this simpler, whatevers.