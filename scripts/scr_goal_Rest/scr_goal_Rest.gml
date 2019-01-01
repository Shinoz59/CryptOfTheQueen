// Argument 0 = object

var obj = argument0;

if (obj.path_position == 1 || obj.state == Object_State.Idle){ // If its at the end of the path.
	
	obj.state = Object_State.Resting
	alarm_set(0, 20); // Rest for 20ish frames?  Might change this later.
}