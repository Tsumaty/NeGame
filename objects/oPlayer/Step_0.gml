// управление
if (keyboard_check(ord("D")))
{
    horsp = min(maxsp, horsp + maxsp / 4);
    if (!keyboard_check(ord("A")))
        isLookingRight = true;
}
if (keyboard_check(ord("A")))
{
    horsp = max(-maxsp, horsp - maxsp / 4);
    if (!keyboard_check(ord("D")))
        isLookingRight = false;
}

// прыжок
if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space))
{
    doJump = true;
    alarm[0] = 20;
}

event_inherited();