/// @description Insert description here
// You can write your code in this editor


// turn sprite to face the direction they are walking.
if (direction >= 306 || direction <= 45){ // using a 90 degree chunk rotated 45 degrees to get a good look.
	image_angle = 0;
}
if (direction >= 46 && direction <= 135){
	image_angle = 90;
}
if (direction >= 136 && direction <= 225){
	image_angle = 180;
}
if (direction >= 226 && direction <= 305){
	image_angle = 270;
}

// OKAY, testing goal stuff.

if (mouse_check_button_pressed(mb_left)) {
	if(instance_exists(obj_goal)){
		instance_destroy(obj_goal); // huh, neat.  didn't know you could do that.
	}
	instance_create_layer(mouse_x, mouse_y, "Instances", obj_goal);
	
	var myPath = path_add();
	mp_potential_path(myPath, obj_goal.x, obj_goal.y, 2, 5, false);
	path_start(myPath, 2, path_action_stop, true);
}

if (instance_exists(obj_goal)){
	mp_potential_step(obj_goal.x, obj_goal.y, 2, false); // needs some shenanigans to make it work, but yeah.
	//mp_linear_step(obj_goal.x, obj_goal.y, 2, false);
}