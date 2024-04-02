/// @description проверка на наличие игрока поблизости
alarm[1] = FPS / 4;

var player = instance_nearest(x, y, oPlayer);
if (player)
{
    showButton = (distance_to_object(player) < chatDist) && (movingAlg == 0);
}
else
{
    deactivateChatCloud(chatCloud);
}

if (isLookingRight)
{
    chatCloud.x = bbox_left - 4;
    chatCloud.isLookingRight = false;
}