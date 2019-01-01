// argument0 - calling object, ie. An enemy.

var Enemy = argument0;
var objDown = instance_find(obj_MoveDownFloor, 0); // Grab this object, should only be one.
var Player = global.Friendlies[0];

Enemy.x = objDown.EnemyX;
Enemy.y = objDown.EnemyY;

Player.x = objDown.PlayerX;
Player.y = objDown.PlayerY;

room_goto(objDown.RoomDestination);

if (Player.x < 1)
	instance_destroy(Player);
	
if (Enemy.x < 1)
	instance_destroy(Enemy);	
