/// @description движение согласно алгоритму
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
            horsp = min(maxsp, horsp + maxsp / 5);
        else
            horsp = max(-maxsp, horsp - maxsp / 5);
    break;
}

event_inherited();