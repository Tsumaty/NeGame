if (playAnim)
{
    scalex = animcurve_channel_evaluate(animCurve, animPos);
    scaley = scalex;
    if (!isLookingRight) scalex *= -1;
    if (animPos < 1) animPos += 0.02;
    //else playAnim = false;
}

if (playMsgAnim)
{
    msgScalex = animcurve_channel_evaluate(msgAnimCurve, msgAnimPos);
    msgScaley = msgScalex;
    if (!isLookingRight) textx = x + sprite_xoffset - sprite_width / 2;
    if (msgAnimPos < 1) msgAnimPos += 0.02;
    //else playMsgAnim = false;
}