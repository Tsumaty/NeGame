if (room_exists(room_next(room)))
{
    playerHp = hp;
    playerHorsp = horsp;
    playerVersp = versp;
    playerRight = isLookingRight;
    switch (room)
    {
        case rTest: playerX = x - 888; break;
        default: playerX = x; break;
    }
    room_goto_next();
}