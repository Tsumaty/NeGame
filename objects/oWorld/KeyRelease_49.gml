var level = rTest;
if (room_exists(level))
{
    playerX = 416;
    playerY = 4;
    playerRight = true;
    playerHorsp = 0;
    playerVersp = 300 / FPS;
    room_goto(level);
}