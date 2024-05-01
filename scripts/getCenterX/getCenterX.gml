function getCenterX(inst)
{
    with (inst)
        return bbox_left + (bbox_right - bbox_left) / 2;
}