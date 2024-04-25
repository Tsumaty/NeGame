image_speed = 0;
// масштаб
scalex = 0;
scaley = 0;
// анимация появления
animCurve = animcurve_get_channel(pingPong, 0);
animPos = 0; // позиция
//animSpeed = 1.2 / FPS; // скорость
playAnim = false; // нужно ли проигрывать
playAnimForwards = true; // проигрывать вперёд
//text = ""; // текст