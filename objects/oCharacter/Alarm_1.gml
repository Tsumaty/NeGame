/// @description проверка на наличие игрока поблизости
alarm[1] = checkPlayerPeriod;

var player = instance_nearest(x, y, oPlayer);
if (player)
{
    var playerIsNearby = (distance_to_object(player) < chatDist && movingAlg == 0);
    if (playerIsNearby && !buttonE.playAnim) with (buttonE)
    {
        //activated = true;
        playAnim = true;
        playAnimForwards = true;
        animPos = 0;
    }
    else with (buttonE)
    {
        //activated = false;
        playAnim = true;
        playAnimForwards = false;
        animPos = 1;
    }
}

chatCloud.isLookingRight = !isLookingRight;
chatCloud.x = (isLookingRight) ? bbox_left - 5 : bbox_right + 4;