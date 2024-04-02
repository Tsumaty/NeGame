if (horsp == platfHorsp)
{
    sprite_index = spriteStop;
    image_speed = breatheSpeed * 85;
}
else
{
    sprite_index = spriteMove;
    image_speed = abs(horsp - platfHorsp) * 30 / FPS;
}
draw_sprite_ext(sprite_index, -1, x, y, scalex, scaley, 0, c_white, image_alpha);