/// @description Insert description here
// You can write your code in this editor

// Make all object variables here
event_inherited(); // grabs the parent stuff.

v_speed = 0;
is_controlling = true;
can_walk = true;

enum facing_direction {
	North = 0,
	East = 1,
	South = 2,
	West = 3
};

facingDirection = facing_direction.North;
