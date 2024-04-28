/// @desc функция отключения диалогового облака
function deactivateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = false;
        // проигрываем анимацию (почти) с конца
        animPos = 0.52;
        //animSpeed = animDefaultSpeed * 1.5; // немного ускоряем
        playAnim = true;
        playAnimForwards = false;
        msgAnimPos = 0.52; // анимацию текста тоже проигрываем с конца
        playMsgAnim = true;
        alarm[0] = 0; // отключаем включение анимации текста
    }
}