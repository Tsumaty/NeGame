if (room == rMenu)
    exit;

var nextLevel = room_next(room);
if (!room_exists(nextLevel))
    exit;

curLevel = nextLevel;
playerHp = hp;
playerHorsp = horsp;
playerVersp = versp;
playerRight = isLookingRight;
var newX, newY;
switch (room)
{
    case rTest:
        newX = x - 888;
        newY = 6;
    break;
        
    default:
        newX = 6;
        newY = y;
    break;
}
playerX = newX;
playerY = newY;
    
ini_open("options.ini");
ini_write_string("GameOptions", "level", curLevel);
ini_write_real("PlayerPosition", "hp", playerHp);
ini_write_real("PlayerPosition", "horsp", playerHorsp);
ini_write_real("PlayerPosition", "versp", playerVersp);
ini_write_real("PlayerPosition", "right", playerRight);
ini_write_real("PlayerPosition", "x", playerX);
ini_write_real("PlayerPosition", "y", playerY);
ini_close();
    
room_goto(nextLevel);