/// @desc проверка смены направления
alarm[0] = changeDirTime;

if (x <= movingBorderLeft || x >= movingBorderRight)
{
    if (movesCyclically)
        maxhorsp *= -1;
    else
        maxhorsp = 0;
}
if (y <= movingBorderTop || y >= movingBorderBottom)
{
    if (movesCyclically)
        maxversp *= -1;
    else
        maxversp = 0;
}