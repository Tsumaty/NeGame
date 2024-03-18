hp = 10; // очки здоровья
maxsp = 270 / FPS; // максимальная скорость
horsp = 0; // скорость по горизонтали
versp = 0; // скорость по вертикали
doJump = false; // находится ли в состоянии прыжка
jumpForce = 900 / FPS; // сила прыжка
liftHeight = sprite_height / 18; // максиальная высота препятствия, на которое можно подняться
initDepVars(maxsp); // ускорение, подъём, замедление

isLookingRight = true; // смотрит ли вправо

scalex = image_xscale; // масштаб спрайта по x
scaley = image_yscale; // масштаб спрайта по y

breathe = animcurve_get_channel(inOutBezier, 0); // анимация дыхания
breathePos = 0; // кадр анимации дыхания
breatheSpeed = 0.36 / FPS; // скорость дыхания

// звуки
stompMaxNum = 0; // количество звуков с одинаковым названием
stompName = "sndStomp"; // название звука
while (asset_get_index(stompName + string(++stompMaxNum)) != -1) {}
stompNum = irandom_range(1, --stompMaxNum); // текущий номер звука

bounceMaxNum = 0;
bounceName = "sndBounce";
while (asset_get_index(bounceName + string(++bounceMaxNum)) != -1) {}
bounceNum = irandom_range(1, --bounceMaxNum);