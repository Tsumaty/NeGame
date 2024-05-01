event_inherited();

initPlayerVars(id);

depth -= 2;

// звуки шагов
var sndNums = initSound(stompName);
stompNum = sndNums[0]; // случайный номер
stompMaxNum = sndNums[1]; // макс. номер

// звуки прыжка
sndNums = initSound(jumpName);
jumpNum = sndNums[0];
jumpMaxNum = sndNums[1];