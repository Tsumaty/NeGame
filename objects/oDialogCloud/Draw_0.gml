if (playAnim)
{
    draw_sprite_ext(sprite_index, -1, x, y, scalex, scaley, 0, c_white, image_alpha);
}

if (playMsgAnim)
{
    if (msgNumber < array_length(msg))
    {
        draw_set_font(fChat);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_black);
        draw_text_transformed(x - sprite_xoffset + sprite_width / 2, y - sprite_yoffset + sprite_height / 2,
                msg[msgNumber], msgScalex, msgScaley, 0);
    }
}