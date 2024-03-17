/// @description управление
if (!isChatting)
{
    if (keyboard_check(BTN_D))
    {
        horsp = min(maxsp, horsp + accelRate);
        if (!keyboard_check(BTN_A))
            isLookingRight = true;
    }
    if (keyboard_check(BTN_A))
    {
        horsp = max(-maxsp, horsp - accelRate);
        if (!keyboard_check(BTN_D))
            isLookingRight = false;
    }

    // прыжок
    if (keyboard_check_pressed(BTN_W) || keyboard_check_pressed(vk_space))
    {
        doJump = true;
        alarm[0] = room_speed / 3;
    }
}

event_inherited();