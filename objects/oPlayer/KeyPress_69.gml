/// @description диалог
// если игрок стоит на месте
if (horsp == 0 && versp == 0)
{
    // ближайший разговаривающий персонаж
    var chatChar = instance_nearest(x, y, oCharacter);
    // если он существует и не двигается
    if (chatChar && chatChar.movingAlg == 0)
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
                else
                {
                    with (chatChar.chatCloud)
                        chatNum = playSnd(chatName, chatNum, chatMaxNum);
                }
            }
            // если игрок не в разговоре
            else
            {
                // игрок начинает разговор
                isChatting = true;
                chatChar.chatCloud.msgNumber = 0;
                activateChatCloud(chatChar.chatCloud);
            }
        }
    }
}