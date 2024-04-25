event_inherited();

// chatMsg = []; // набор фраз для разговора
// диалоговое облако
chatCloud = instance_create_depth(bbox_right + 4, bbox_top, depth - 10, oDialogCloud, {msg : chatMsg});
chatDist = 170; // расстояние активации возможности разговора
checkPlayerPeriod = FPS / 4; // период проверки, рядом ли игрок
alarm[1] = checkPlayerPeriod;

// кнопка диалога
buttonE = instance_create_depth(x, bbox_top - 16, depth - 5, oButton, {text : "E"});

// алгоритм движения
// 0 - стоять на месте
// 1 - двигаться влево-вправо пока не дойдёт до x-координаты movingBorderLeft или movingBorderRight
// 2 - прыгать на месте с периодом jumpDelay
// movingAlg = 0;
// movingBorderLeft = x - 100;
// movingBorderRight = x + 100;
// jumpDelay = 180;
canChangeDir = true; // может ли менять направление
changeDirTime = FPS / 2; // время возможности смены направления

canJump = true; // может ли прыгать

if (movingAlg == 2) alarm[3] = jumpDelay;