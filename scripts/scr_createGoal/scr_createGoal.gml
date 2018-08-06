// Argument0 object
// Argument1 - x position
// Argument2 - y position

var obj = argument0;
var xpos = argument1;
var ypos = argument2;
scr_RemoveFog(obj);

	// obj-goal will be more of a debug thing at the moment, but should work regardless.
instance_create_layer(xpos, ypos, "Instances", obj_goal);
		
var myPath = path_add();
mp_grid_path(myGrid, myPath, x, y, obj_goal.x, obj_goal.y, false);
	//mp_potential_path(myPath, obj_goal.x, obj_goal.y, 2, 5, false);
path_start(myPath, 2, path_action_stop, true);
state = Enemy_State.Exploring;