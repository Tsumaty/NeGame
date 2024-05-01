/// @desc диалог

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
            // номер реплики увеличивается
            // и если он превышает максимальное количество реплик персонажа
            if (++chatChar.chatCloud.msgNumber >= array_length(chatChar.chatCloud.msg))
            {
                // разговор прекращается
                isChatting = false;
                with (chatChar)
                {
                    chatted = true;
                    --chatCloud.msgNumber;
                    deactivateChatCloud(chatCloud);
                    with (buttonE) image_index = 1;
                }
            }
            else
            {
                // иначе запускается следующая реплика
                chatChar.chatCloud.msgTimer = 0;
            }
        }
        // если игрок не в разговоре
        else
        {
            // персонаж разворачивается к игроку
            chatChar.isLookingRight = bool(sign(x - chatChar.x));
            with (chatChar)
            {
                //chatCloud.isLookingRight = !isLookingRight;
                // начинается разговор
                chatCloud.msgNumber = 0;
                activateChatCloud(chatCloud);
            }
            isChatting = true;
        }
    }
}