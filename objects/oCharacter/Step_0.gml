/// @description движение по алгоритму
switch (movingAlg)
{
    case 1:
        // если может менять направление и достиг границы движения
        if (canChangeDir && (x <= movingBorderLeft || x >= movingBorderRight))
        {
            // если двигается циклически
            if (movesCyclically)
            {
                // временно не может менять направление
                canChangeDir = false;
                alarm[2] = changeDirTime;
                // разворачивается
                isLookingRight = !isLookingRight;
                moveRight = isLookingRight;
                moveLeft = !isLookingRight;
            }
            else
            {
                // иначе просто останавливается
                moveRight = moveLeft = false;
            }
        }
    break;
    /*
    case 2:
        // если может прыгнуть
        if (canJump)
        {
            // делает прыжок
            doJump = true;
            alarm[0] = FPS / 2;
            // временно не может прыгать
            canJump = false;
            alarm[3] = jumpDelay;
        }
    break;*/
}

event_inherited();