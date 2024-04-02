// падение
versp = min(MAXFALLSP, versp + GRAVITACCEL);

// платформа
var platf = instance_place(x, y + 3, oPlatform);

// проверка опоры stand под ногами
var colRect = function(stand)
{
    return collision_rectangle(bbox_left + 1, bbox_bottom - 10, bbox_right - 1,
                               bbox_bottom + 3, stand, true, true);
}

// стоит ли на платформе
var onPlatform = (platf && versp >= 0 && colRect(oPlatform));

// добавочные скорости от движущейся платформы
platfHorsp = 0;
var platfVersp = 0;
if (onPlatform && platf.object_index == oMovingFloor)
{
    platfHorsp = platf.horsp;
    platfVersp = platf.versp;
}

// приземление или удар об потолок
if (place_meeting(x, y + versp, oObstacle) || onPlatform)
{
    if (versp >= 600 / FPS)
        groundNum = playSound(groundName, groundNum, groundMaxNum);
    versp = min(max(0, versp), platfVersp);
}

// движение
if (moveRight)
{
    horsp = min(maxsp + platfHorsp, horsp + accelRate);
    moveRight = false;
}
if (moveLeft)
{
    horsp = max(-maxsp + platfHorsp, horsp - accelRate);
    moveLeft = false;
}

// столкновение со стеной
if (place_meeting(x + horsp, y + versp, oObstacle))
{
    var newhorsp = platfHorsp;
    if (horsp > platfHorsp)
        newhorsp = max(platfHorsp, horsp - decelRate + platfHorsp);
    else if (horsp < platfHorsp)
        newhorsp = min(platfHorsp, horsp + decelRate + platfHorsp);
    
    var newversp = -liftMaxsp + platfVersp;
    
    if (place_meeting(x + newhorsp, y - (bbox_bottom - bbox_top) / 10, oObstacle))
    {
        horsp = 0;
    }
    else
    {
        horsp = newhorsp;
        versp = newversp;
    }
}

// что под ногами
var stand = colRect(oStand); // любая опора
var croogl = colRect(oCrooglick); // круглик

// прыжок
if (doJump && !place_meeting(x + horsp + platfVersp, y - jumpForce + platfVersp, oObstacle) &&
    (stand || croogl))
{
    versp = -jumpForce + platfVersp;
    doJump = false;
    // если оттолкнулся от круглика
    if (croogl && !stand)
    {
        // воспроизвести звук отскока
        bounceNum = playSound(bounceName, bounceNum, bounceMaxNum);
    }
}

// векторный толчок
hspeed = horsp;
vspeed = versp;

// трение
if (horsp > platfHorsp)
{
    if (stand)
        horsp = max(platfHorsp, horsp - stand.frictForce);
    else
        horsp = max(platfHorsp, horsp - WINDAGE);
}
else if (horsp < platfHorsp)
{
    if (stand)
        horsp = min(platfHorsp, horsp + stand.frictForce);
    else
        horsp = min(platfHorsp, horsp + WINDAGE);
}

// дыхание
scalex = animcurve_channel_evaluate(breathe, breathePos) / 20;
scaley = scalex + image_yscale;
scalex += abs(image_xscale);
if (horsp < platfHorsp || (!isLookingRight && horsp == platfHorsp))
    scalex *= -1;

breathePos = (breathePos + breatheSpeed) mod 1;