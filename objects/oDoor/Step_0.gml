if (activated)
{
    if (isOpening)
    {
        if (bbox_top < bottomY)
        {
            versp = min(openSpeed, versp + openAccelRate);
            if (!audio_is_playing(sndGrindingStart) && !audio_is_playing(sndGrindingLoop))
            {
                audio_play_sound(sndGrindingStart, 10, false);
                alarm[0] = 0.43 * FPS;
            }
        }
        else
        {
            activated = false;
            isOpening = false;
            audio_stop_sound(sndGrindingStart);
            audio_stop_sound(sndGrindingLoop);
            audio_play_sound(sndGrindingEnd, 10, false);
        }
    }
    else
    {
        if (bbox_bottom > bottomY)
        {
            versp = max(-openSpeed, versp - openAccelRate);
            if (!audio_is_playing(sndGrindingStart) && !audio_is_playing(sndGrindingLoop))
            {
                audio_play_sound(sndGrindingStart, 10, false);
                alarm[0] = 0.43 * FPS;
            }
        }
        else
        {
            activated = false;
            isOpening = true;
            audio_stop_sound(sndGrindingStart);
            audio_stop_sound(sndGrindingLoop);
            audio_play_sound(sndGrindingEnd, 10, false);
        }
    }
}

vspeed = versp;

if (surface)
{
    surface.vspeed = vspeed;
}

if (versp > 0)
    versp = max(0, versp - openAccelRate);
else if (versp < 0)
    versp = min(0, versp + openAccelRate);