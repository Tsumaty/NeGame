event_inherited();

// диалоговое облако
chatCloud = instance_create_depth(bbox_right + 4, bbox_top, depth - 10, oDialogCloud);
// chatMsg = []; // набор фраз для разговора
chatCloud.msg = chatMsg;
chatDist = 170; // расстояние активации возможности разговора
alarm[1] = FPS / 4; // период проверки необходимости отключать диалоговое облако
showButton = false; // показывать ли кнопку возможности разговора

// алгоритм движения
// 0 - стоять на месте
// 1 - двигаться влево-вправо пока не дойдёт до x-координаты movingxLeft или movingxRight
// movingAlg = 0;
// movingLeft = -1000;
// movingRight = room_width + 999;
canChangeDir = true; // может ли менять направление
changeDirTime = FPS / 2; // время возможности смены направления