/// @description Insert description here
// You can write your code in this editor

 // Movement code.  Probably too weird at the moment, but it works.
if (keyboard_check(vk_right)) {
	if (sprite_index != sp_Protag_WalkRight){
		sprite_index = sp_Protag_WalkRight;
		image_index = 0;
	}
	if (floor(image_index) == 3 || floor(image_index) == 5){
		x += 3;	
	}
	else if (floor(image_index) == 4){
		x += 4;	
	}
	else
		x += 1;
}
else if (keyboard_check(vk_up)) {
	if (sprite_index != sp_Protag_WalkUp){
		sprite_index = sp_Protag_WalkUp;
		image_index = 0;
	}
	if (floor(image_index) == 3 || floor(image_index) == 5){
		y -= 3;	
	}
	else if (floor(image_index) == 4){
		y -= 4;	
	}
	else
		y -= 1;
}
else if (keyboard_check(vk_left)) {
	if (sprite_index != sp_Protag_WalkLeft){
		sprite_index = sp_Protag_WalkLeft;
		image_index = 0;
	}
	if (floor(image_index) == 3 || floor(image_index) == 5){
		x -= 3;	
	}
	else if (floor(image_index) == 4){
		x -= 4;	
	}
	else
		x -= 1;
}
else if (keyboard_check(vk_down)) {
	if (sprite_index != sp_Protag_WalkDown){
		sprite_index = sp_Protag_WalkDown;
		image_index = 0;
	}
	if (floor(image_index) == 3 || floor(image_index) == 5){
		y += 3;	
	}
	else if (floor(image_index) == 4){
		y += 4;	
	}
	else
		y += 1;
}
else if (sprite_index != sp_Protag_Idle){
	sprite_index = sp_Protag_Idle;	
}