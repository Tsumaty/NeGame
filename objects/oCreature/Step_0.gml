// падение
versp = min(3000 / FPS, versp + 60 / FPS);

// проверка опоры stand под ногами
var colRect = function(stand)
{
    return collision_rectangle(bbox_left + 1, bbox_bottom - 14,
            bbox_right - 1, bbox_bottom + 3, stand, true, true);
}

// стоит ли на земле
var ground = colRect(oObstacle);

// прыжок
if (doJump && !place_meeting(x, y - jumpForce, oObstacle) && (ground || colRect(oCrooglick)))
{
    versp = -jumpForce;
    doJump = false;
    // если оттолкнулся от круглика
    if (colRect(oCrooglick))
    {
        // воспроизвести звук отскока
        bounceNum = playSnd(bounceName, bounceNum, stompMaxNum);
    }
}

// столкновение с полом или потолком
if (place_meeting(x, y + versp, oObstacle))
{
    if (versp >= 600 / FPS)
        stompNum = playSnd(stompName, stompNum, stompMaxNum);
    versp = 0;
}

// столкновение со стеной
if (place_meeting(x + horsp, y, oObstacle))
{
    if (horsp != 0 && !place_meeting(x + horsp, y + versp - liftHeight, oObstacle))
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