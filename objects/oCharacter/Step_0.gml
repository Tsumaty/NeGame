/// @description движение по алгоритму
switch (movingAlg)
{
    case 1:
        if (canChangeDir && (x <= movingLeft || x >= movingRight))
        {
            isLookingRight = !isLookingRight;
            canChangeDir = false;
            alarm[2] = changeDirTime;
        }
        
        if (isLookingRight)
            moveRight = true;
        else
            moveLeft = true;
    break;
}

event_inherited();