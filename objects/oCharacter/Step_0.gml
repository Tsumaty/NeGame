/// @description движение по алгоритму
switch (movingAlg)
{
    case 1:
        if (canChangeDir && (x <= movingxLeft || x >= movingxRight))
        {
            isLookingRight = !isLookingRight;
            canChangeDir = false;
            alarm[2] = changeDirTime;
        }
        
        if (isLookingRight)
            horsp = min(maxsp, horsp + accelRate);
        else
            horsp = max(-maxsp, horsp - accelRate);
    break;
}

event_inherited();