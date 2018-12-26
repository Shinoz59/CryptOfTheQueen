// argument 0 = player.
var player = argument0;

player.dx = 0;
player.dy = 0;

 // Movement code.  Probably too weird at the moment, but it works.
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
	if (player.sprite_index != sp_Protag_WalkRight){
		player.sprite_index = sp_Protag_WalkRight;
		player.image_index = 0;
	}
	player.facingDirection = facing_direction.East;
	player.dx += player.walkSpeed;
}
else if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
	if (player.sprite_index != sp_Protag_WalkUp){
		player.sprite_index = sp_Protag_WalkUp;
		player.image_index = 0;
	}
	player.facingDirection = facing_direction.North;
	player.dy -= player.walkSpeed;
}
else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
	if (player.sprite_index != sp_Protag_WalkLeft){
		player.sprite_index = sp_Protag_WalkLeft;
		player.image_index = 0;
	}
	player.dx -= player.walkSpeed;
	player.facingDirection = facing_direction.West;
}
else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
	if (player.sprite_index != sp_Protag_WalkDown){
		player.sprite_index = sp_Protag_WalkDown;
		player.image_index = 0;
	}
	player.dy += player.walkSpeed;
	player.facingDirection = facing_direction.South;
}
else if (player.sprite_index != sp_Protag_Idle){
	player.sprite_index = sp_Protag_Idle;	
}

player.x += dx;
player.y += dy;