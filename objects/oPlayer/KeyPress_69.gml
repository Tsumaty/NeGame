/// @description диалог
if (isChatting && instance_exists(chatCharacter) && instance_exists(chatCharacter.chatCloud))
{
	isChatting = false;
	instance_destroy(chatCharacter.chatCloud);
}
else if (canChat && instance_exists(chatCharacter))
{
	chatCharacter.chatCloud = instance_create_depth(chatCharacter.bbox_right + 9, chatCharacter.bbox_top - 12, -10, oDialogCloud);
	isChatting = true;
}