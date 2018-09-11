// spawns an attack slash effect - may be just temporary.
// argument0 - creating object.
var obj = argument0;

var spawn_x = obj.x;
var spawn_y = obj.y;
var a_sprite_angle = 0; // For rotating the sprite I guess
		
switch (obj.facingDirection){ // facing direction should be universal for all playable objects.
	case facing_direction.North:
		spawn_y -= obj.sprite_height;
		break;
	case facing_direction.South:
		spawn_y += obj.sprite_height;
		a_sprite_angle = 180;
		break;
	case facing_direction.West:
		spawn_x -= obj.sprite_width;
		a_sprite_angle = 90;
		break;
	case facing_direction.East:
		spawn_x += obj.sprite_width;
		a_sprite_angle = 270;
		break;
}

var attack = instance_create_layer(spawn_x, spawn_y, "Instances", obj_Attack);
attack.image_angle = a_sprite_angle;
attack.controllingPlayer = obj;
attack.team = 0;