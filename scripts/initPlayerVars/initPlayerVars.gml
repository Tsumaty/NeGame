/// @desc инициализация переменных игрока
function initPlayerVars(player)
{
    with (player)
    {
        hp = playerHp;
        x = playerX;
        y = playerY;
        horsp = playerHorsp / FPS;
        versp = playerVersp / FPS;
        isLookingRight = playerRight;
        isChatting = false; //playerChat;
        chatChar = noone; // персонаж, с которым разговаривает
    
        // пустой объект по центру для следования камеры
        var createCenter = function()
        {
            var center = instance_create_depth(getCenterX(self.id), getCenterY(self.id), depth, oBlank);
            var mainCamera = view_get_camera(0);
            camera_set_view_target(mainCamera, center);
            camera_set_view_border(mainCamera, camera_get_view_width(mainCamera) / 2 * 0.97,
                                    camera_get_view_height(mainCamera) / 2 * 0.95);
            camera_set_view_speed(mainCamera, 360 / FPS, 600 / FPS);
            return center;
        }
    
        center = createCenter();
    }
}