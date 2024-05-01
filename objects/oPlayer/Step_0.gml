/// @desc управление
if (!isChatting)
{
    if (keyboard_check(BTN_D))
    {
        moveRight = true;
        if (!keyboard_check(BTN_A))
            isLookingRight = true;
    }
    if (keyboard_check(BTN_A))
    {
        moveLeft = true;
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

if (!isChatting && !doJump && (keyboard_check_pressed(BTN_W) || keyboard_check_pressed(vk_space))
    && isSilent(jumpName))
{
    var rand = random(9);
    if (rand >= 7)
        jumpNum = playSound(jumpName, jumpNum, jumpMaxNum);
}

center.x = getCenterX(id);
center.y = getCenterY(id);