function deactivateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = false;
        playAnim = false;
        playMsgAnim = false;
        alarm[0] = 0;
        animPos = 0;
        msgAnimPos = 0;
    }
}