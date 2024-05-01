function getCenterY(inst)
{
    with (inst)
        return bbox_top + (bbox_bottom - bbox_top) / 2;
}