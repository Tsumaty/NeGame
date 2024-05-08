/// @desc проверка на наличие игрока поблизости
alarm[1] = checkPlayerPeriod;

if (!onMovingPlatform && isMoving == 0 && horsp == 0 && versp == GRAVITACCEL)
{
    with (oPlayer)
    {
        if (distance_to_object(other) < other.chatDist)
        {
            chatChar = other.id;
            if (!other.buttonE.activated)
                activateButtonE(other.buttonE);
        }
        else if (chatChar == other.id)
        {
            isChatting = false;
            chatChar = noone;
            if (other.buttonE.activated)
                deactivateButtonE(other.buttonE);
            if (other.chatCloud.activated)
                deactivateChatCloud(other.chatCloud);
        }
    }
}