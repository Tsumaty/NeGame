var level = rLevel1;
if (room_exists(level))
{
    playerX = 240;
    playerY = 4;
    playerRight = true;
    playerHorsp = 0;
    playerVersp = 300 / FPS;
    room_goto(level);
}