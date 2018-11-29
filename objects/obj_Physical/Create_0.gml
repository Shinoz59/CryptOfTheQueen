/// @description Insert description here
// You can write your code in this editor

dx = 0; // velocity
dy = 0;

enum facing_direction {
	North = 0,
	East = 1,
	South = 2,
	West = 3
};

enum Object_State {
	Idle = 0,
	Exploring = 2,
	HitStun = 3,
	Fleeing = 4,
	Attacking = 5
};

tilemap = layer_tilemap_get_id("CollisionTiles");
// sprite info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
facingDirection = facing_direction.North;
state = Object_State.Idle;