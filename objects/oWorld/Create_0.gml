/// @desc глобальные переменные
globalvar BTN_D, BTN_A, BTN_W, FPS, WINDAGE, MAXMOVESP, GRAVITACCEL;
BTN_D = ord("D");
BTN_A = ord("A");
BTN_W = ord("W");
FPS = game_get_speed(gamespeed_fps); // скорость игры
WINDAGE = 12.0 / FPS; // сопротивление воздуха
MAXMOVESP = 3000.0 / FPS; // предел скорости передвижения
GRAVITACCEL = 60.0 / FPS; // ускорение свободного падения

// переменные игрока, которые
// меняются при переходе между румами
globalvar curLevel/*, prevLevel*/, playerHp, playerHorsp, playerVersp, playerRight, playerX, playerY,
          playerCanBounce, playerIncreasedJumpsNum, enterLevelJumpTrainCount;
/*curLevel = rMenu;
prevLevel = rMenu;*/

ini_open("options.ini");
// текущий уровень
var level = ini_read_real("GameOptions", "level", rMenu);
if (room_exists(level))
    curLevel = level;
else
{
    curLevel = rMenu;
    ini_write_real("GameOptions", "level", curLevel);
}
playerHp = ini_read_real("PlayerVariables", "hp", 10);
playerHorsp = ini_read_real("PlayerVariables", "horsp", 0);
playerVersp = ini_read_real("PlayerVariables", "versp", 0);
playerRight = ini_read_real("PlayerVariables", "right", true);;
playerX = ini_read_real("PlayerVariables", "x", 804);
playerY = ini_read_real("PlayerVariables", "y", 16);
playerCanBounce = ini_read_real("PlayerVariables", "can_bounce", false);
playerIncreasedJumpsNum = ini_read_real("PlayerVariables", "increasedjumps_num", 0);
enterLevelJumpTrainCount = ini_read_real("GameOptions", "enter_leveljump_count", 0);
ini_close();

/*playerHp = 10;
playerHorsp = 0;
playerVersp = 0;
playerRight = true;
playerX = 804;
playerY = 4;*/

room_goto(curLevel);