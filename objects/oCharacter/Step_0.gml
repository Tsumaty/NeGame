/// @description движение по алгоритму
switch (movingAlg)
{
    case 1:
        if (canChangeDir && (x <= movingBorderLeft || x >= movingBorderRight))
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
    
    case 2:
        if (canJump)
        {
            doJump = true;
            alarm[0] = FPS / 2;
            canJump = false;
            alarm[3] = jumpPeriod;
        }
    break;
}

event_inherited();