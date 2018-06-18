/// @description Insert description here
// You can write your code in this editor


if (is_controlling == true){
	 // handle base movement.
	if (can_walk == true){
		scr_NormalWalk(id);
		scr_TileCollission(id);
	}
	 // Attacking?
	if (keyboard_check(vk_space) && can_walk){
		can_walk = false;
		var spawn_x = x;
		var spawn_y = y;
		var a_sprite_angle = 0; // For rotating the sprite I guess
		
		switch (facingDirection){
			case facing_direction.North:
				spawn_y -= sprite_height;
				break;
			case facing_direction.South:
				spawn_y += sprite_height;
				a_sprite_angle = 180;
				break;
			case facing_direction.West:
				spawn_x -= sprite_width;
				a_sprite_angle = 90;
				break;
			case facing_direction.East:
				spawn_x += sprite_width;
				a_sprite_angle = 270;
				break;
		}
		var attack = instance_create_layer(spawn_x, spawn_y, "Instances", obj_Attack);
		attack.image_angle = a_sprite_angle;
		attack.controllingPlayer = id;
	}
}
