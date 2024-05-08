event_inherited();
defJumpForce = jumpForce; // стандартная сила прыжка
increasedJumpForce = 2 * defJumpForce; // увеличенная сила прыжка
initVars = function()
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
initVars();
depth -= 2;

// звуки шагов
var sndNums = initSound(stompName);
stompNum = sndNums[0]; // случайный номер
stompMaxNum = sndNums[1]; // макс. номер

// звуки прыжка
sndNums = initSound(jumpName);
jumpNum = sndNums[0];
jumpMaxNum = sndNums[1];

// звуки смерти
sndNums = initSound(deathName);
deathNum = sndNums[0];
deathMaxNum = sndNums[1];