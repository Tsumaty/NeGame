/// @description период проверки на наличие игрока поблизости
var player = instance_nearest(x, y, oPlayer);
if (player)
{
    if (distance_to_object(player) < chatDist && movingAlg == 0)
    {
        showButton = true;
    }
    else
    {
        showButton = false;
        //deactivateChatCloud(chatCloud);
        //player.isChatting = false;
    }
}
else
{
    deactivateChatCloud(chatCloud);
}

alarm[1] = room_speed / 4;

if (isLookingRight)
{
    chatCloud.x = bbox_left - 4;
    chatCloud.isLookingRight = false;
}