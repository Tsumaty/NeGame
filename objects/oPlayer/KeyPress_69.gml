/// @description диалог
// если игрок стоит на месте
if (horsp == 0 && versp == 0)
{
    // ближайший разговаривающий персонаж
    var chatChar = instance_nearest(x, y, oCharacter);
    if (chatChar != noone && chatChar.movingAlg == 0)
    {
        // если персонаж достаточно близко
        if (distance_to_object(chatChar) < chatChar.chatDist)
        {
            // если игрок уже разговаривает
            if (isChatting)
            {
                // номер реплики увеличивается
                if (++chatChar.chatCloud.msgNumber >= array_length(chatChar.chatCloud.msg))
                {
                    isChatting = false;
                    //chatChar.chatCloud.msgNumber = 0;
                    deactivateChatCloud(chatChar.chatCloud);
                }
            }
            // если игрок не в разговоре
            else// if (instance_exists(prevChatChar) && !prevChatChar.chatCloud.activated)
            {
                // игрок начинает разговор
                isChatting = true;
                chatChar.chatCloud.msgNumber = 0;
                activateChatCloud(chatChar.chatCloud);
            }
        }
        /*// если персонаж далеко
        else
        {
            // разговор заканчивется
            deactivateChatCloud(chatChar.chatCloud);
            isChatting = false;
        }*/
    }
}