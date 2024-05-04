// проверка опоры stand под ногами
var colBottom = function(stand)
{
    return collision_ellipse(bbox_left + 1, bbox_bottom - (bbox_bottom - bbox_top) / 5 + 2,
                             bbox_right - 1, bbox_bottom + 2, stand, true, true);
}

// движущаяся платформа
var movingPlatf = colBottom(oMovingFloor);

// стоит ли на движущейся платформе
onMovingPlatform = (movingPlatf && versp >= movingPlatf.vspeed);

// скорости движущейся платформы
platfHorsp = (onMovingPlatform) ? movingPlatf.hspeed : 0;
platfVersp = (onMovingPlatform) ? movingPlatf.vspeed : 0;

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

// столкновение с полом или потолком
if (place_meeting(x, y + versp, oObstacle) || (colBottom(oPlatform) && versp > platfVersp))
{
    // при высокой скорости воспроизводится звук падения
    if (versp >= 720 / FPS)
        groundNum = playSound(groundName, groundNum, groundMaxNum);
    /*
    if (place_empty(x, y + platfVersp, oObstacle))
        versp = platfVersp;
    else
        versp = 0;*/
    versp = platfVersp;
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
    if (slowedhorsp != platfHorsp && place_empty(x + slowedhorsp, y + uppedversp, oObstacle))
    {
        // замедляемся и поднимаемся
        horsp = slowedhorsp;
        versp = uppedversp;
    }
    else
    {
        horsp = platfHorsp;
    }
    /*
    // если можно подняться
    if (place_empty(x + horsp, y - liftMaxHeight, oObstacle))
    {
        // поднимаемся и замедляемся
        //versp = max(-liftMaxSpeed, versp - liftSpeed);
        if (horsp > platfHorsp)
            horsp = max(platfHorsp, horsp - decelRate);
        else if (horsp < platfHorsp)
            horsp = min(platfHorsp, horsp + decelRate);
    }
    else
    {
        if (place_empty(x + platfHorsp, y, oObstacle))
            horsp = platfHorsp;
        else
            horsp = 0;
    }*/
}

// что под ногами
stand = colBottom(oStand); // любая опора
var croogl = colBottom(oCrooglick); // круглик
var kwadr = colBottom(oKwadrick); // квадрик

// прыжок
if (doJump && (stand || croogl || kwadr)/* &&
    place_empty(x + horsp, y + platfVersp - jumpForce, oObstacle)*/)
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
//x += horsp;
//y += versp;
move_and_collide(horsp, versp, oObstacle, 2, 0, 0, MAXMOVESP, MAXMOVESP);

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