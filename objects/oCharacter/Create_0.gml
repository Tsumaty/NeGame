event_inherited();

// диалоговое облако индивидуально для каждого персонажа
chatCloud = instance_create_depth(bbox_right + 4, bbox_top, depth - 10, oDialogCloud);
chatMsg = []; // набор фраз для разговора
chatCloud.msg = chatMsg;
chatDist = 170; // расстояние активации возможности разговора
alarm[1] = room_speed / 4; // период проверки необходимости отключать диалоговое облако
showButton = false; // показывать ли кнопку возможности разговора

// алгоритм движения
// 0 - стоять на месте
// 1 - двигаться влево-вправо пока не дойдёт до x-координаты movingxLeft или movingxRight
movingAlg = 0;
movingxLeft = -1000;
movingxRight = room_width + 999;
//movingTime = 15; // период проверки направления
canChangeDir = true; // может ли менять направление
changeDirTime = room_speed / 2; // время возможности смены направления