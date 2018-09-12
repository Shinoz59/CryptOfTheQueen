/// @description Insert description here
// You can write your code in this editor


if (is_controlling == true){ // for if the game's paused or something.
	 // handle base movement.
	if (state != Object_State.Attacking && state != Object_State.HitStun){
		scr_NormalWalk(id);
	}
	if (state == Object_State.Attacking){
		chargeTime += 1;
		scr_PlayerCharge(id, chargeTime);
	}
	if (state == Object_State.HitStun){ // get knocked around.
		x += dx;
		y += dy; 
	}
	 // Attacking?
	if (keyboard_check(vk_space) && state != Object_State.Attacking && 
	state != Object_State.HitStun && (dx != 0 || dy != 0)){ // should be moving
		state = Object_State.Attacking; // Is turned back on by the attack object when it finishes
		chargeTime = 0; // frames since charge started
	}
	
	scr_TileCollission(id); // Should collide with tiles regardless of anything else going on.
}
