//
// облако
//
activated = false; // активировано ли
isLookingRight = true; // повёрнуто вправо
// масштаб
scalex = 0;
scaley = 0;
// анимация
animCurve = animcurve_get_channel(pingPong, 0);
animPos = 0; // позиция
animSpeed = 1.2 / FPS; // скорость
playAnim = false; // нужно ли проигрывать

//
// сообщения
//
msg = [];
msgNumber = 0; // номер
// координаты
msgx = bbox_left + (bbox_right - bbox_left) / 2;
msgy = bbox_top + (bbox_bottom - bbox_top) / 2;
// масштаб
msgScalex = 0;
msgScaley = 0;
// анимация
msgAnimCurve = animcurve_get_channel(pingPong, 0);
msgAnimPos = 0; // позиция
playMsgAnim = false; // нужно ли проигрывать

chatMaxNum = 0;
chatName = "sndChat";
while (asset_get_index(chatName + string(++chatMaxNum)) != -1) {}
chatNum = irandom_range(1, --chatMaxNum);