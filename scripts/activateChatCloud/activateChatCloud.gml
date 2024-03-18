function activateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = true;
        playAnim = true;
        playMsgAnim = false;
        alarm[0] = FPS / 4;
        animPos = 0;
        msgAnimPos = 0;
    }
}