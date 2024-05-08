ini_open("options.ini");
ini_write_string("GameOptions", "level", curLevel);
ini_write_real("GameOptions", "enter_leveljump_count", enterLevelJumpTrainCount);
ini_write_real("PlayerVariables", "hp", playerHp);
ini_write_real("PlayerVariables", "x", playerX);
ini_write_real("PlayerVariables", "y", playerY);
ini_write_real("PlayerVariables", "horsp", playerHorsp);
ini_write_real("PlayerVariables", "versp", playerVersp);
ini_write_real("PlayerVariables", "right", playerRight);
ini_write_real("PlayerVariables", "can_bounce", playerCanBounce);
ini_write_real("PlayerVariables", "increasedjumps_num", playerIncreasedJumpsNum);
ini_close();

stopGrindingSound();

switch (room)
{
    case rLevelJumpTrain:
        if (enterLevelJumpTrainCount > 1)
        {
            if (enterLevelJumpTrainCount > 2)
                with (inst_7E52E5C7)
                {
                    chatCloud.msg = ["Всё равно не\nполучается?",
                                     "А если так?",
                                     "У тебя есть\nтри попытки"];
                    // усиливаем силу прыжка игрока
                    with (oPlayer)
                    {
                        endChatChar = other.id;
                        endChatEvent = "increase jump force";
                    }
                    // (жел-но ещё чтоб ноги засветились синим)
                }
            else
                with (inst_7E52E5C7)
                {
                    chatCloud.msg = ["Не допрыгиваешь, да?",
                                     "Попробуй от чего-\nнибудь отскочить",
                                     "...или от кого-нибудь"];
                    // теперь игрок может отталкиваться от персонажей
                    with (oPlayer)
                    {
                        endChatChar = other.id;
                        endChatEvent = "can bounce";
                    }
                }
        }
    break;
    
    case rMenu:
        ini_open("options.ini");
        with (oDoor)
        {
            isOpen = ini_read_real("MenuOptions", string("door{0}_isopen", int64(id)), isOpen);
            isOpening = !isOpen;
            y = (isOpen) ? openPos : closedPos;
            with (surface)
            {
                y = (other.isOpen) ? other.surfaceOpenPos : other.surfaceClosedPos;
            }
        }
        ini_close();
    break;
}