if (playAnim)
{
    scalex = animcurve_channel_evaluate(animCurve, animPos);
    scaley = scalex;
    if (!isLookingRight) scalex *= -1;
    if (animPos < 1) animPos += animSpeed;
}

if (playMsgAnim)
{
    msgScalex = animcurve_channel_evaluate(msgAnimCurve, msgAnimPos);
    msgScaley = msgScalex;
    if (!isLookingRight) msgx = bbox_left - (bbox_right - bbox_left) / 2;
    if (msgAnimPos < 1) msgAnimPos += animSpeed;
}