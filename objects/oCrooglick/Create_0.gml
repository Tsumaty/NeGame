event_inherited();
breatheSpeed = 0.008;

chatCloud = instance_create_depth(bbox_right + 6, bbox_top - 5, depth - 10, oDialogCloud);
chatMsg = ["Привет", "Как твои дела?"];
chatCloud.msg = chatMsg;
chatDist = 170; // расстояние активации возможности диалога
alarm[1] = 15; // период проверки необходимости отключать диалоговое облако
showButton = false; // показывать ли кнопку возможности диалога
//playerCanChat = false;
