/// @description Setup Enemy data
// You can write your code in this editor
event_inherited(); // grabs the parent stuff.
bounceSpeed = 4;
 // State machine states for the enemies in general.  Add in more as stuff gets more complicated.


// Need to figure out the pathing stuff.
path_position = 1;
myHealth = 20; // need the hero to be killable
global.TrackedHealth = myHealth;
//path_start(explore_path, 2, path_action_stop, true);
//path_position = 1; // easiest way to get the path stuff jumpstarted.


attackCooldown = 100;
attackCooldownMax = 100;

invinicble_flash = 0;
invincible = false;

target = noone;
goal_found = false;
goal_x = 0;
goal_y = 0;