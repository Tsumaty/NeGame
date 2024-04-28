event_inherited();

hp = playerHp;
x = playerX;
y = playerY;
horsp = playerHorsp;
versp = playerVersp;
isLookingRight = playerRight;
isChatting = false; //playerChat;
chatChar = noone; // персонаж, с которым разговаривает

depth -= 2;

camera_set_view_speed(view_camera[0], 360 / FPS, 360 / FPS);
camera_set_view_border(view_camera[0], view_wport[0] / 2 - (view_wport[0] / 128),
                       view_hport[0] / 2 - (view_hport[0] / 108));

// центр спрайта
getCenterX = function()
{
    return bbox_left + (bbox_right - bbox_left) / 2;
}
getCenterY = function()
{
    return bbox_top + (bbox_bottom - bbox_top) / 2;
}

// пустой объект по центру для следования камеры
createCenter = function()
{
    var center = instance_create_depth(getCenterX(), getCenterY(), depth, oBlank);
    var mainCamera = view_get_camera(0);
    camera_set_view_target(mainCamera, center);
    camera_set_view_border(mainCamera, camera_get_view_width(mainCamera) / 2 * 0.97,
                           camera_get_view_height(mainCamera) / 2 * 0.95);
    camera_set_view_speed(mainCamera, 360 / FPS, 600 / FPS);
    return center;
}

center = createCenter();

// звуки шагов
stompName = "sndStomp";
var sndNums = initSound(stompName);
stompNum = sndNums[0];
stompMaxNum = sndNums[1];

// звуки прыжка
jumpName = "sndJump";
sndNums = initSound(jumpName);
jumpNum = sndNums[0];
jumpMaxNum = sndNums[1];