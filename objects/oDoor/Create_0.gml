event_inherited();

activated = false;
openSpeed /= FPS; // скорость открытия/закрытия
openAccelRate *= openSpeed; // скорость ускорения
versp = 0; // текущая скорость
bottomY = bbox_bottom; // нижняя граница движения
isOpening = true; // будет открываться или закрываться