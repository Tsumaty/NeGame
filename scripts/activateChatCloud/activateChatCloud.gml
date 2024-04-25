// функция активации диалогового облака
function activateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        //activated = true;
        // проигрываем анимацию с начала
        animPos = 0;
        animSpeed = animDefaultSpeed;
        playAnim = true;
        playAnimForwards = true;
        // через нек-е время включаем анимацию текста
        alarm[0] = FPS / 4;
    }
}