// argument0 = 'enemy' object.
var obj = argument0;

//if (mouse_check_button_pressed(mb_left)) {
if(obj.path_position == 1 || obj.state == Object_State.Idle){ // If its at the end of the path.
	if(instance_exists(obj_goal)){
		instance_destroy(obj_goal); // huh, neat.  didn't know you could do that.
	}
	var ypos = random(8) - 4; // should be between -3 and 3, possibly 4.
	var xpos = random(8) - 4;
	var objx = floor(obj.x) - floor(obj.x) % 32 + 16;
	var objy = floor(obj.y) - floor(obj.y) % 32 + 16;
	ypos = floor(ypos) * 32; // scale it to the size of the grid.
	xpos = floor(xpos) * 32;
	xpos += objx; // Need some kind of snapping to grid here, otherwise it'll slowly drift off of the grid.
	ypos += objy;
	
	scr_createGoal(obj, xpos, ypos);
}
//}