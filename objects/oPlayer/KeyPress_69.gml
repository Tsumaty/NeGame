/// @description диалог
var chatChar = instance_nearest(x, y, oCrooglick);

if (chatChar != noone)
{
    if (distance_to_object(chatChar) < chatChar.chatDist)
    {
        if (isChatting)
        {
            if (++chatChar.chatCloud.msgNumber >= array_length(chatChar.chatCloud.msg))
            {
                isChatting = false;
                chatChar.chatCloud.msgNumber = 0;
                deactivateChatCloud(chatChar.chatCloud);
            }
        }
        else
        {
            isChatting = true;
            activateChatCloud(chatChar.chatCloud);
        }
    }
}