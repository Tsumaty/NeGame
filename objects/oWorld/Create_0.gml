/// @description глобальные переменные
globalvar BTN_D, BTN_A, BTN_W, FPS, WINDAGE, MAXFALLSP, GRAVITACCEL;
BTN_D = ord("D");
BTN_A = ord("A");
BTN_W = ord("W");
FPS = game_get_speed(gamespeed_fps); // скорость игры
WINDAGE = 13.2 / FPS; // сопротивление воздуха
MAXFALLSP = 3000 / FPS; // максимальная скорость падения
GRAVITACCEL = 60 / FPS; // ускорение свободного падения

// переменные игрока, которые
// меняются при переходе между румами
globalvar playerHp, playerHorsp, playerVersp, playerRight, playerX;
playerHp = 10;
playerHorsp = 0;
playerVersp = 0;
playerRight = true;
playerX = 480;