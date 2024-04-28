/// @description диалог

// если игрок стоит на месте
if (hspeed == 0 && vspeed == 0 && !onMovingPlatform)
{
    // ближайший разговаривающий персонаж
    chatChar = instance_nearest(x, y, oCharacter);
    // если он существует, не двигается и достаточно близко
    if (chatChar && chatChar.hspeed == 0 && chatChar.vspeed == 0 && !chatChar.onMovingPlatform
        && !chatChar.isMoving && distance_to_object(chatChar) < chatChar.chatDist)
    {
        chatChar.chatCloud.msgAnimPos = 0; // проиграть анимацию текста с начала
        // если игрок уже разговаривает
        if (isChatting)
        {
            var msgMaxNum = array_length(chatChar.chatCloud.msg) - 1;
            // номер реплики увеличивается
            // и если он превышает максимальное количество реплик персонажа
            if (++chatChar.chatCloud.msgNumber > msgMaxNum)
            {
                // разговор прекращается
                isChatting = false;
                --chatChar.chatCloud.msgNumber;
                deactivateChatCloud(chatChar.chatCloud);
            }
            else
            {
                // иначе запускается следующая реплика
                with (chatChar.chatCloud)
                {
                    msgVisible = false;
                    alarm[0] = 1;
                }
            }
        }
        // если игрок не в разговоре
        else
        {
            // персонаж разворачивается к игроку
            chatChar.isLookingRight = bool(sign(x - chatChar.x));
            //chatChar.chatCloud.isLookingRight = !chatChar.isLookingRight;
            // начинается разговор
            chatChar.chatCloud.msgNumber = 0;
            activateChatCloud(chatChar.chatCloud);
            isChatting = true;
        }
    }
}