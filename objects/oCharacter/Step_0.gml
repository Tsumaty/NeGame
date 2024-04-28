/// @desc движение по алгоритму
if (isMoving)
{
    moveRight = isMovingRight;
    moveLeft = !isMovingRight;
}

event_inherited();

buttonE.hspeed = hspeed;
buttonE.vspeed = vspeed;
chatCloud.isLookingRight = !isLookingRight;
chatCloud.x = (isLookingRight) ? bbox_left - 4 : bbox_right + 4;