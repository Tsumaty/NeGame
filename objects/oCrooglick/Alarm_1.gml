var player = instance_nearest(x, y, oPlayer);

if (instance_exists(player))
{
    if (distance_to_object(player) < chatDist)
    {
        showButton = true;
    }
    else
    {
        showButton = false;
        if (distance_to_object(player) > chatDist * 1.5)
            deactivateChatCloud(chatCloud);
    }
}
else
{
    deactivateChatCloud(chatCloud);
}

alarm[1] = 15;