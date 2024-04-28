if (room == rMenu && y < 0)
    exit;

var nextLevel = room_next(room);
if (!room_exists(nextLevel))
    exit;

curLevel = nextLevel;
playerHp = hp;
playerHorsp = horsp;
playerVersp = versp;
playerRight = isLookingRight;
//var newX, newY;
switch (room)
{
    case rMenu:
        x = median(130, x - 350, 860);
        y = 6;
    break;
    
    case rTest:
        x = median(140, x - 888, 2030);
        y = 6;
    break;
        
    default:
        x = 100;
        y = 6;
    break;
}
playerX = x;
playerY = y;
    
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