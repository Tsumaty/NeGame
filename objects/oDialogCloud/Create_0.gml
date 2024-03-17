//
// облако
//
activated = false; // активировано ли
scalex = 0; // масштаб по x
scaley = 0; // масштаб по y
animPos = 0; // позиция анимации
animCurve = animcurve_get_channel(pingPong, 0); // анимация
playAnim = false; // нужно ли проигрывать анимацию
//
// сообщения
//
msg = [];
msgNumber = 0;
msgScalex = 0;
msgScaley = 0;
msgAnimPos = 0;
msgAnimCurve = animcurve_get_channel(pingPong, 0);
playMsgAnim = false;

isLookingRight = true;
textx = x - sprite_xoffset + sprite_width / 2;
texty = y - sprite_yoffset + sprite_height / 2;