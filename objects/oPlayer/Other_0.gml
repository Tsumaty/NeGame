/// @desc переход на следующий уровень
if (room == rMenu && y < 0)
    exit;

if (room == rLevelJumpTrain && y >= room_height)
{
    ++enterLevelJumpTrainCount;
    room_restart();
    deathNum = playSound(deathName, deathNum, deathMaxNum);
    playerCanBounce = canBounce;
    playerIncreasedJumpsNum = increasedJumpsNum;
    exit;
}

var nextLevel = room_next(room);
var newX, newY;

switch (room)
{
    case rMenu:
        if (x >= room_width)
        {
            nextLevel = rLevelJumpTrain;
            newX = 4;
            newY = median(4, y - 114, 834);
            ++enterLevelJumpTrainCount;
        }
        else
        {
            nextLevel = rTest;
            newX = median(130, x - 350, 860);
            newY = 4;
        }
        
        ini_open("options.ini");
        with (oDoor)
        {
            ini_write_real("MenuOptions", string("door{0}_isopen", int64(id)), isOpen);
        }
        ini_close();
    break;
    
    case rTest:
        nextLevel = rLevel1;
        newX = median(140, x - 888, 2030);
        newY = 4;
    break;
    
    case rLevel1:
        if (x >= room_width)
        {
            nextLevel = rMenu;
            newX = 804;
            newY = 16;
            horsp = 0;
            versp = 0;
        }
    break;
    
    case rLevelJumpTrain:
        if (x < 0)
        {
            nextLevel = rMenu;
            newX = 1593;
            newY = median(4, y + 110, 922);
            --enterLevelJumpTrainCount;
        }
    break;
}

if (!room_exists(nextLevel))
    exit;

//prevLevel = room;
curLevel = nextLevel;
playerHp = hp;
playerX = newX;
playerY = newY;
playerHorsp = horsp * FPS;
playerVersp = versp * FPS;
playerRight = isLookingRight;
playerIncreasedJumpsNum = increasedJumpsNum;
    
room_goto(nextLevel);