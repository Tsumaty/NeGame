/// @description глобальные переменные
globalvar BTN_D, BTN_A, BTN_W, FPS, WINDAGE, MAXFALLSP, GRAVITACCEL;
BTN_D = ord("D");
BTN_A = ord("A");
BTN_W = ord("W");
FPS = game_get_speed(gamespeed_fps); // скорость игры
WINDAGE = 12.6 / FPS; // сопротивление воздуха
MAXFALLSP = 3000 / FPS; // максимальная скорость падения
GRAVITACCEL = 60 / FPS; // ускорение свободного падения

// переменные игрока, которые
// меняются при переходе между румами
globalvar curLevel, playerHp, playerHorsp, playerVersp, playerRight, playerX, playerY, playerChat;

ini_open("options.ini");
// текущий уровень
var level = ini_read_real("GameOptions", "level", rTest);
if (room_exists(level))
    curLevel = level;
else
{
    curLevel = rTest;
    ini_write_real("GameOptions", "level", curLevel);
}
playerHp = ini_read_real("PlayerPosition", "hp", 10);
playerHorsp = ini_read_real("PlayerPosition", "horsp", 0);
playerVersp = ini_read_real("PlayerPosition", "versp", 0);
playerRight = ini_read_real("PlayerPosition", "right", true);;
playerX = ini_read_real("PlayerPosition", "x", 480);
playerY = ini_read_real("PlayerPosition", "y", 16);
playerChat = ini_read_real("PlayerPosition", "chat", false);
ini_close();

room_goto(curLevel);