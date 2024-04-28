/// @desc функция включения диалогового облака
function activateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = true;
        // проигрываем анимацию с начала
        animPos = 0;
        //animSpeed = animDefaultSpeed;
        playAnim = true;
        playAnimForwards = true;
        // анимацию сообщения временно отключаем
        msgVisible = false;
        msgAnimPos = 0;
        playMsgAnim = false;
        alarm[0] = FPS / 4;
    }
}