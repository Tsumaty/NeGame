/// @desc прыжок
if (movesCyclically)
    alarm[3] = jumpDelay;

isMoving = true;
if (chatCloud.activated)
{
    // отключаем облако
    deactivateChatCloud(chatCloud);
    // отключаем кнопку
    if (buttonE.activated)
        deactivateButtonE(buttonE);
    // игрок с нами больше не разговаривает
    for (var i = 0; i < instance_number(oPlayer); ++i)
    {
        var player = instance_find(oPlayer, i);
        if (player && player.isChatting && player.chatChar == id)
            player.isChatting = false;
    }
}
doJump = true;
alarm[0] = FPS / 2;