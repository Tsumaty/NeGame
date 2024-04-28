event_inherited();

// максимальные скорости
maxhorsp /= FPS;
maxversp /= FPS;
// текущие скорости
horsp /= FPS;
versp /= FPS;
// скорости ускорения
horAccelRate *= maxhorsp;
verAccelRate *= maxversp;

changeDirTime *= FPS; // время проверки смены направления
alarm[0] = changeDirTime;