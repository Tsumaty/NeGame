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
        alarm[0] = FPS / 3;
    }
}

event_inherited();

center.x = bbox_left + (bbox_right - bbox_left) / 2;
center.y = bbox_top + (bbox_bottom - bbox_top) / 2;