/// @desc проверка на наличие игрока поблизости
alarm[1] = checkPlayerPeriod;

var player = instance_nearest(x, y, oPlayer);
if (player)
{
    var playerIsNearby = (!isMoving && distance_to_object(player) < chatDist);
    if (playerIsNearby)
    {
        if (!buttonE.activated)
            activateButtonE(buttonE);
    }
    else
    {
        if (buttonE.activated)
            deactivateButtonE(buttonE);
    }
}