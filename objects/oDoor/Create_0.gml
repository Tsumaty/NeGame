event_inherited();

activated = false;
openSpeed /= FPS; // скорость открытия/закрытия
openAccelRate *= openSpeed; // скорость ускорения
versp = 0; // текущая скорость
isOpening = !isOpen; // будет открываться или закрываться
var openLength = bbox_bottom - bbox_top;
with (surface) openLength = bbox_bottom - bbox_top;
if (isOpen)
{
    openPos = y;
    closedPos = y - openLength;
    surfaceOpenPos = openPos;
    surfaceClosedPos = closedPos;
    with (surface)
    {
        other.surfaceOpenPos = y;
        other.surfaceClosedPos = y - openLength;
    }
}
else
{
    openPos = y + openLength;
    closedPos = y;
    surfaceOpenPos = openPos;
    surfaceClosedPos = closedPos;
    with (surface)
    {
        other.surfaceOpenPos = y + openLength;
        other.surfaceClosedPos = y;
    }
}