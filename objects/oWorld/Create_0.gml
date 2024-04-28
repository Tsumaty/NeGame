/// @description глобальные переменные
globalvar BTN_D, BTN_A, BTN_W, FPS, WINDAGE, MAXMOVESP, GRAVITACCEL;
BTN_D = ord("D");
BTN_A = ord("A");
BTN_W = ord("W");
FPS = game_get_speed(gamespeed_fps); // скорость игры
WINDAGE = 12.6 / FPS; // сопротивление воздуха
MAXMOVESP = 3000 / FPS; // предел скорости передвижения
GRAVITACCEL = 60 / FPS; // ускорение свободного падения

// переменные игрока, которые
// меняются при переходе между румами
globalvar curLevel, playerHp, playerHorsp, playerVersp, playerRight, playerX, playerY/*, playerChat*/;
/*
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
playerHp = ini_read_real("PlayerPosition", "hp", 10);
playerHorsp = ini_read_real("PlayerPosition", "horsp", 0);
playerVersp = ini_read_real("PlayerPosition", "versp", 0);
playerRight = ini_read_real("PlayerPosition", "right", true);;
playerX = ini_read_real("PlayerPosition", "x", 480);
playerY = ini_read_real("PlayerPosition", "y", 16);
playerChat = ini_read_real("PlayerPosition", "chat", false);
ini_close();

room_goto(curLevel);
*/
playerHp = 10;
playerHorsp = 0;
playerVersp = 0;
playerRight = true;
playerX = 804;
playerY = 4;

room_goto(rMenu);