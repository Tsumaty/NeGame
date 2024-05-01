event_inherited();

// chatMsg = []; // набор фраз для разговора
// диалоговое облако
chatCloud = instance_create_depth(bbox_right + 4, bbox_top, depth - 10, oDialogCloud,
    {msg : chatMsg});
chatDist = 170; // расстояние активации возможности разговора
checkPlayerPeriod = FPS / 4; // период проверки, рядом ли игрок
alarm[1] = checkPlayerPeriod + int64(id) % 10;
chatted = false; // до конца ли с ним поговорили

// кнопка диалога
buttonE = instance_create_depth(x, bbox_top - 16, depth - 5, oButton,
    {text : "E", visible : false});

// алгоритм движения
// 0 - стоять на месте
// 1 - двигаться влево-вправо пока не дойдёт до movingBorderLeft или movingBorderRight
// 2 - прыгать на месте с периодом jumpDelay
// movingAlg = 0;
// movingBorderLeft = x - 100;
// movingBorderRight = x + 100;
//canChangeDir = true; // может ли менять направление

//isMoving = (changeDirTime > 0); // находится ли в состоянии движения
isMovingRight = isLookingRight; // куда идёт - вправо или влево

//canJump = true; // может ли прыгать

if (changeDirTime > 0) // время проверки смены направления
{
    changeDirTime *= FPS;
    alarm[2] = changeDirTime;
}
if (jumpDelay > 0) // задержка перед прыжком
{
    jumpDelay *= FPS;
    alarm[3] = jumpDelay;
}