/// @description звуки шагов
if (event_data[? "event_type"] == "sprite event")
{
    switch (event_data[? "message"])
    {
        case "stomp":
            if (collision_rectangle(bbox_left + 1, bbox_bottom - 14, bbox_right - 1,
                                    bbox_bottom + 10, oStand, true, true))
            {
                stompNum = playSound(stompName, stompNum, stompMaxNum);
            }
        break;
    }
}