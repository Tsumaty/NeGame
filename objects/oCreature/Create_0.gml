var spriteName = "s" + name; // название спрайта
var spriteNameStop = spriteName + "Stop"; // название спрайта неподвижности
var spriteNameMove = spriteName + "Move"; // название спрайта передвижения
spriteStop = sprite_index; // спрайт неподвижности
var sprite = asset_get_index(spriteNameStop);
if (sprite != -1) spriteStop = sprite;
spriteMove = sprite_index; // спрайт передвижения
sprite = asset_get_index(spriteNameMove);
if (sprite != -1) spriteMove = sprite;

// isLookingRight = true; // смотрит ли вправо
// hp = 10; // очки здоровья
initSpeeds(maxsp); // максимальная скорость и всё, что от неё зависит
horsp = 0; // текущая скорость по горизонтали
versp = 0; // текущая скорость по вертикали
moveRight = false; // идёт ли вправо
moveLeft = false; // идёт ли влево
doJump = false; // находится ли в состоянии прыжка
// jumpForce = 900 / FPS; // сила прыжка
//liftMaxHeight = (bbox_bottom - bbox_top) / 14; // макс. высота преп-вия, на к-ю можно подняться
// platf = noone; // платформа, на которую можно запрыгнуть снизу через неё
// onPlatform = false; // стоит ли на платформе
platfHorsp = 0; // гориз. ск-ть платформы
// platfVersp = 0; // верт. ск-ть платформы

scalex = image_xscale; // масштаб спрайта по x
scaley = image_yscale; // масштаб спрайта по y

breathe = animcurve_get_channel(inOutBezier, 0); // анимация дыхания
breathePos = 0; // кадр анимации дыхания

// звуки отскока
bounceName = "sndBounce"; // название группы звуков
var sndNums = initSound(bounceName); // массив из двух чисел
bounceNum = sndNums[0]; // текущий номер
bounceMaxNum = sndNums[1]; // максимальный номер

// звуки приземления
groundName = "sndStomp";
sndNums = initSound(groundName);
groundNum = sndNums[0];
groundMaxNum = sndNums[1];