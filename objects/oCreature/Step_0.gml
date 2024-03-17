// падение
versp = min(50, versp + room_speed / 60);

// прямоугольник проверки опоры stand под ногами
var colRect = function(stand)
{
    return collision_rectangle(bbox_left + 1, bbox_bottom - 14,
            bbox_right - 1, bbox_bottom + 3, stand, true, true);
}

var ground = colRect(oObstacle);

// прыжок
if (doJump && !place_meeting(x, y - jumpForce, oObstacle) && (ground || colRect(oCrooglick)))
{
    versp = -jumpForce;
    doJump = false;
}

// столкновение с полом
if (place_meeting(x, y + versp, oObstacle))
{
    versp = 0;
}

// столкновение со стеной
if (place_meeting(x + horsp, y, oObstacle))
{
    if (!place_meeting(x + horsp, y + versp - liftHeight, oObstacle))
    {
        versp = max(-maxsp, versp - liftSpeed);
        if (horsp > 0)
            horsp = max(0, horsp - decelRate);
        else
            horsp = min(0, horsp + decelRate);
    }
    else
    {
        horsp = 0;
    }
}

// движение
hspeed = horsp;
vspeed = versp;

// трение
if (horsp > 0)
{
    if (ground)
        horsp = max(0, horsp - ground.frictForce);
    else
        horsp = max(0, horsp - WINDAGE);
}
else if (horsp < 0)
{
    if (ground)
        horsp = min(0, horsp + ground.frictForce);
    else
        horsp = min(0, horsp + WINDAGE);
}

// дыхание
scalex = animcurve_channel_evaluate(breathe, breathePos) / 20;
scaley = scalex + image_yscale;
scalex += abs(image_xscale);
if (horsp < 0 || (!isLookingRight && horsp == 0))
    scalex *= -1;

breathePos = (breathePos + breatheSpeed) mod 1;