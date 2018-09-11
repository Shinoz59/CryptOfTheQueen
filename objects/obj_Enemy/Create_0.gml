/// @description Insert description here
// You can write your code in this editor
event_inherited(); // grabs the parent stuff.
bounceSpeed = 4;
 // State machine states for the enemies in general.  Add in more as stuff gets more complicated.
enum Enemy_State {
	Idle = 0,
	Exploring = 2,
	HitStun = 3,
	Fleeing = 4
};

// Need to figure out the pathing stuff.
path_position = 1;
myHealth = 20; // need the hero to be killable
global.TrackedHealth = myHealth;
//path_start(explore_path, 2, path_action_stop, true);
//path_position = 1; // easiest way to get the path stuff jumpstarted.

fogTilemap = layer_tilemap_get_id("Tiles_2"); // The fog of war tileset

state = Enemy_State.Idle; // Should start pathing immediatly.

attackCooldown = 60;
attackCooldownMax = 60;