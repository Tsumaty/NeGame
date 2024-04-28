// проверка опоры stand под ногами
var colBottom = function(stand)
{
    return collision_ellipse(bbox_left + 1, bbox_bottom - (bbox_bottom - bbox_top) / 4 + 1,
                             bbox_right - 1, bbox_bottom + 2, stand, true, true);
}

// движущаяся платформа
var movingPlatf = colBottom(oMovingFloor);

// стоит ли на движущейся платформе
onMovingPlatform = (movingPlatf && vspeed >= 0);

// скорости движущейся платформы
platfHorsp = (onMovingPlatform) ? movingPlatf.hspeed : 0;
platfVersp = (onMovingPlatform) ? movingPlatf.vspeed : 0;

// движение
if (moveRight)
{
    horsp = min(maxsp + platfHorsp, horsp + accelRate + platfHorsp);
    moveRight = false;
}
if (moveLeft)
{
    horsp = max(-maxsp + platfHorsp, horsp - accelRate + platfHorsp);
    moveLeft = false;
}

/*// добавляем скорости платформы
horsp += platfHorsp;
versp += platfVersp;*/

/*// ограничиваем скорости
horsp = median(-MAXMOVESP, horsp, MAXMOVESP);
versp = median(-MAXMOVESP, versp, MAXMOVESP);*/

// столкновение с полом или потолком
if (place_meeting(x, y + versp, oObstacle) || (colBottom(oPlatform) && vspeed >= 0))
{
    // при высокой скорости воспроизводится звук падения
    if (versp >= 660 / FPS)
        groundNum = playSound(groundName, groundNum, groundMaxNum);
    
    if (place_empty(x, y + platfVersp, oObstacle))
        versp = platfVersp;
    else
        versp = 0;
}

// столкновение со стеной
if (place_meeting(x + horsp, y, oObstacle))
{
    var slowedhorsp = platfHorsp;
    if (horsp > platfHorsp)
        slowedhorsp = max(platfHorsp, horsp - decelRate);
    else if (horsp < platfHorsp)
        slowedhorsp = min(platfHorsp, horsp + decelRate);
    
    var uppedversp = max(-liftMaxSpeed, versp - liftSpeed);
    
    // если можно подняться
    if (place_empty(x + horsp, y - liftMaxHeight, oObstacle))
    {
        // поднимаемся и замедляемся
        versp = uppedversp;
        horsp = slowedhorsp;
    }
    else
    {
        if (place_meeting(x + platfHorsp, y, oObstacle))
            horsp = 0;
        else
            horsp = platfHorsp;
    }
}

// что под ногами
var stand = colBottom(oStand); // любая опора
var croogl = colBottom(oCrooglick); // круглик
var kwadr = colBottom(oKwadrick); // квадрик

// прыжок
if (doJump && (stand || croogl || kwadr) &&
    place_empty(x + horsp, y + platfVersp - jumpForce, oObstacle))
{
    versp = platfVersp - jumpForce;
    doJump = false;
    // если оттолкнулся от круглика
    if (!stand && (croogl || kwadr))
    {
        // воспроизвести звук отскока
        bounceNum = playSound(bounceName, bounceNum, bounceMaxNum);
    }
}

// векторный толчок
x += horsp;
y += versp;

// падение
versp += GRAVITACCEL;

// трение
if (horsp > platfHorsp)
{
    var frict = (stand) ? stand.frictForce : WINDAGE;
    horsp = max(platfHorsp, horsp - frict);
}
else if (horsp < platfHorsp)
{
    var frict = (stand) ? stand.frictForce : WINDAGE;
    horsp = min(platfHorsp, horsp + frict);
}

// дыхание
scalex = animcurve_channel_evaluate(breathe, breathePos) / 20;
scaley = scalex + image_yscale;
scalex += abs(image_xscale);
if (horsp < platfHorsp || (!isLookingRight && horsp == platfHorsp))
    scalex *= -1;

breathePos = (breathePos + breatheSpeed) % 1.0;