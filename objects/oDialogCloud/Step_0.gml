if (playAnim)
{
    visible = true;
    scalex = animcurve_channel_evaluate(animCurve, animPos);
    scaley = scalex;
    if (!isLookingRight) scalex *= -1;
    
    if (playAnimForwards)
    {
        animPos += animSpeed;
        if (animPos > 1)
        {
            animPos = 1;
            playAnim = false; 
        }
    }
    else
    {
        animPos -= animSpeed;
        if (animPos < 0)
        {
            animPos = 0;
            playAnim = false;
            visible = false;
        }
    }
}

if (playMsgAnim)
{
    msgVisible = true;
    msgScalex = animcurve_channel_evaluate(msgAnimCurve, msgAnimPos);
    msgScaley = msgScalex;
    //if (!isLookingRight) msgx = bbox_left + (bbox_left - bbox_right) / 2 + 30;
    
    if (playAnimForwards)
    {
        msgAnimPos += msgAnimSpeed;
        if (msgAnimPos > 1)
        {
            msgAnimPos = 1;
            playMsgAnim = false;
        }
    }
    else
    {
        msgAnimPos -= msgAnimSpeed;
        if (msgAnimPos < 0)
        {
            msgAnimPos = 0;
            playMsgAnim = false;
            msgVisible = false;
        }
    }
}