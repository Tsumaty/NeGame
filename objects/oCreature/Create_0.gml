hp = 10; // очки здоровья
maxsp = room_speed / 15; // максимальная скорость
horsp = 0; // скорость по горизонтали
versp = 0; // скорость по вертикали
doJump = false; // находится ли в состоянии прыжка
accelRate = maxsp / 5; // скорость ускорения
jumpForce = room_speed / 4; // сила прыжка
liftHeight = sprite_height / 20; // максиальная высота препятствия, на которое можно подняться
liftSpeed = maxsp / 2; // скорость подъёма
decelRate = maxsp / 24; // скорость замедления при подъёме

isLookingRight = true; // смотрит ли вправо

scalex = image_xscale; // масштаб спрайта по x
scaley = image_yscale; // масштаб спрайта по y

breathe = animcurve_get_channel(inOutBezier, 0); // анимация дыхания
breathePos = 0; // кадр анимации дыхания
breatheSpeed = room_speed / 10000; // скорость дыхания
