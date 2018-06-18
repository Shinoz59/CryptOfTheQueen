// argument0 = object
var player = argument0;

 // Movement code.  Probably too weird at the moment, but it works.
if (keyboard_check(vk_right)) {
	if (player.sprite_index != sp_Protag_WalkRight){
		player.sprite_index = sp_Protag_WalkRight;
		player.image_index = 0;
	}
	if (floor(player.image_index) == 3 || floor(player.image_index) == 5){
		player.x += 3;	
	}
	else if (floor(player.image_index) == 4){
		player.x += 4;	
	}
	else
		player.x += 1;
}
else if (keyboard_check(vk_up)) {
	if (player.sprite_index != sp_Protag_WalkUp){
		player.sprite_index = sp_Protag_WalkUp;
		player.image_index = 0;
	}
	if (floor(player.image_index) == 3 || floor(player.image_index) == 5){
		player.y -= 3;	
	}
	else if (floor(player.image_index) == 4){
		player.y -= 4;	
	}
	else
		player.y -= 1;
}
else if (keyboard_check(vk_left)) {
	if (player.sprite_index != sp_Protag_WalkLeft){
		player.sprite_index = sp_Protag_WalkLeft;
		player.image_index = 0;
	}
	if (floor(player.image_index) == 3 || floor(player.image_index) == 5){
		player.x -= 3;	
	}
	else if (floor(player.image_index) == 4){
		player.x -= 4;	
	}
	else
		player.x -= 1;
}
else if (keyboard_check(vk_down)) {
	if (player.sprite_index != sp_Protag_WalkDown){
		player.sprite_index = sp_Protag_WalkDown;
		player.image_index = 0;
	}
	if (floor(player.image_index) == 3 || floor(player.image_index) == 5){
		player.y += 3;	
	}
	else if (floor(player.image_index) == 4){
		player.y += 4;	
	}
	else
		player.y += 1;
}
else if (player.sprite_index != sp_Protag_Idle){
	player.sprite_index = sp_Protag_Idle;	
}