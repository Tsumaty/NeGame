image_xscale = 0.66667;
image_yscale = 0.66667;

event_inherited();

hp = playerHp;
horsp = playerHorsp;
versp = playerVersp;
isLookingRight = playerRight;
isChatting = false;

depth -= 2;

camera_set_view_speed(view_camera[0], 360 / FPS, 360 / FPS);
camera_set_view_border(view_camera[0], view_wport[0] / 2 - (view_wport[0] / 128),
        view_hport[0] / 2 - (view_hport[0] / 108));

// пустой объект по центру маски спрайта для следования камеры
center = instance_create_depth(bbox_left + (bbox_right - bbox_left) / 2,
        bbox_top + (bbox_bottom - bbox_top) / 2, depth, oBlank);
camera_set_view_target(view_get_camera(0), center);