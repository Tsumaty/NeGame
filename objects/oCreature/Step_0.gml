// падение
versp = min(50, versp + 1);

// столкновение с полом
if (place_meeting(x, y + versp, oObstacle))
{
    // versp = max(0, versp - 20);
    versp = 0;
}

// прямоугольник столкновения у ног
/*colRect = function(_x, yTop, yBottom)
{
    return collision_rectangle(bbox_left + _x, bbox_bottom + yTop,
            bbox_right + _x, bbox_bottom + yBottom, oObstacle, true, true);
}*/

// столкновение со стеной
if (/*horsp != 0 && */place_meeting(x + horsp, y + versp, oObstacle))
{
    if (!place_meeting(x + horsp, y + versp - 4, oObstacle))
    {
        versp = max(-4, versp - 2);
        //versp -= abs(horsp) / 2;
        if (horsp > 0)
        {
            horsp = max(0, horsp - 0.2);
        }
        else
        {
            horsp = min(0, horsp + 0.2);
        }
    }
    else
    {
        /*if (horsp > 0)
        {
            horsp = max(0, horsp - 20);
        }
        else
        {
            horsp = min(0, horsp + 20);
        }*/
        horsp = 0;
    }
}

// прыжок
if (doJump && !place_meeting(x, y - 15, oObstacle) && (collision_ellipse(bbox_left + 1, bbox_bottom - 14,
        bbox_right - 1, bbox_bottom + 3, oObstacle, true, true) ||
        collision_ellipse(bbox_left + 1, bbox_bottom - 14,
        bbox_right - 1, bbox_bottom + 3, oCrooglick, true, true)))
{
    versp = -15;
    doJump = false;
}

// движение
hspeed = horsp;
vspeed = versp;

// трение
if (horsp > 0)
    horsp = max(0, horsp - maxsp / 18);
else if (horsp < 0)
    horsp = min(0, horsp + maxsp / 18);

// дыхание
scalex = animcurve_channel_evaluate(breathe, breathePos) / 20 + 1;
scaley = scalex;
if (horsp < 0 || (!isLookingRight && horsp == 0))
    scalex *= -1;

breathePos = (breathePos + breatheSpeed) mod 1;