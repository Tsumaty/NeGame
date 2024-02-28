if (instance_exists(oPlayer))
{
	if (distance_to_object(oPlayer) < 150)
	{
		oPlayer.canChat = true;
		oPlayer.chatCharacter = self;
	}
	else
	{
		oPlayer.canChat = false;
		oPlayer.chatCharacter = noone;
	}
	if (distance_to_object(oPlayer) > 300 && instance_exists(chatCloud))
	{
		instance_destroy(chatCloud);
	}
}

alarm[1] = 15;