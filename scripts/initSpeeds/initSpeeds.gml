function initSpeeds(sp)
{
    accelRate = sp / 5; // скорость ускорения
    liftSpeed = sp * 1.5; // скорость подъёма
    liftMaxHeight = (bbox_bottom - bbox_top) / 10;
    decelRate = sp / 8; // скорость замедления
}