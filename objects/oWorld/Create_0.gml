/// @description макросы
#macro BTN_D ord("D")
#macro BTN_A ord("A")
#macro BTN_W ord("W")
#macro FPS game_get_speed(gamespeed_fps) // скорость игры
#macro WINDAGE 13.2 / FPS // сопротивление воздуха

globalvar playerHp, playerHorsp, playerVersp, playerRight;
playerHp = 10;
playerHorsp = 0;
playerVersp = 0;
playerRight = true;