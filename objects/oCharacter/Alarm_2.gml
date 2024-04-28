/// @desc проверка смены направления
alarm[2] = changeDirTime;

if (x <= movingBorderLeft || x >= movingBorderRight)
{
    if (movesCyclically)
    {
        isMovingRight = !isMovingRight;
        isLookingRight = !isLookingRight;
    }
    else
    {
        isMoving = false;
    }
}
//canChangeDir = true;