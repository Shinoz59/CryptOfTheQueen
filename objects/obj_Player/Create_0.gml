/// @description Insert description here
// You can write your code in this editor

// Make all object variables here

randomize(); // just stored here for now, don't worry about it.
v_speed = 0;
is_controlling = true;
can_walk = true;

tilemap = layer_tilemap_get_id("Tiles_1");

dx = 0; // velocity
dy = 0;

// sprite info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

enum facing_direction {
	North = 0,
	East = 1,
	South = 2,
	West = 3
};

facingDirection = facing_direction.North;
