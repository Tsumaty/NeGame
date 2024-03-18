if (horsp != 0)
{
    sprite_index = sPlayerMove;
    image_speed = horsp / (225 / FPS);
}
else
{
    sprite_index = sPlayerStop;
    image_speed = 0;
}
event_inherited();