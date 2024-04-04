/// @description диалог
// если игрок стоит на месте
if (horsp == 0 && versp == 0 && !onMovingPlatform)
{
    // ближайший разговаривающий персонаж
    var chatChar = instance_nearest(x, y, oCharacter);
    // если он существует и не двигается
    if (chatChar && chatChar.horsp == 0 && chatChar.versp == 0 && chatChar.movingAlg == 0)
    {
        // если персонаж достаточно близко
        if (distance_to_object(chatChar) < chatChar.chatDist)
        {
            chatChar.chatCloud.msgAnimPos = 0; // проиграть анимацию текста с начала
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
                    // звук разговора
                    with (chatChar.chatCloud)
                    {
                        //if (isSilent(chatName))
                        chatNum = playSound(chatName, chatNum, chatMaxNum, true);
                    }
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