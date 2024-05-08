/// @desc инициализация переменных игрока (не исп-ся)
function initPlayerVars(player=self)
{
    with (player)
    {
        hp = playerHp;
        x = playerX;
        y = playerY;
        horsp = playerHorsp / FPS;
        versp = playerVersp / FPS;
        isLookingRight = playerRight;
        canBounce = playerCanBounce;
        isChatting = false;
        chatChar = noone; // персонаж, с которым разговаривает
        endChatChar = noone; // когда заканчивает разговор с этим персонажем,
        endChatEvent = ""; // происходит это событие
        increasedJumpsNum = playerIncreasedJumpsNum; // оставшееся кол-во усиленных прыжков
        jumpForce = (increasedJumpsNum > 0) ? increasedJumpForce : defJumpForce;
    
        // пустой объект по центру для следования камеры
        var center = instance_create_depth(getCenterX(), getCenterY(), depth, oBlank);
        var mainCamera = view_get_camera(0);
        camera_set_view_target(mainCamera, center);
        camera_set_view_border(mainCamera, camera_get_view_width(mainCamera) / 2 * 0.97,
                                camera_get_view_height(mainCamera) / 2 * 0.95);
        camera_set_view_speed(mainCamera, 360 / FPS, 600 / FPS);
        spriteCenter = center;
    }
}