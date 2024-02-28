// падение
versp = min(50, versp + 1);

// столкновение с полом
if (place_meeting(x, y + versp, oFloor))
{
	// versp = max(0, versp - 20);
	versp = 0;
}

// прямоугольник столкновения у ног
/*function colRect(_x, yTop, yBottom)
{
	return collision_rectangle(bbox_left + _x, bbox_bottom + yTop,
			bbox_right + _x, bbox_bottom + yBottom, oFloor, true, true);
}*/

// столкновение со стеной
if (horsp != 0 && place_meeting(x + horsp, y + versp, oFloor))
{
	if (!place_meeting(x + horsp, y - 4, oFloor))
	{
		versp = max(-4, versp - 2);
		//versp -= abs(horsp) / 2;
		if (horsp > 0)
		{
			horsp = max(0, horsp - 0.2);
		}
		else
		{
			horsp = min(0, horsp + 0.2);
		}
	}
	else
	{
		/*if (horsp > 0)
		{
			horsp = max(0, horsp - 20);
		}
		else
		{
			horsp = min(0, horsp + 20);
		}*/
		horsp = 0;
	}
}

// прыжок
if (doJump && !place_meeting(x + horsp, y - 15, oFloor) && collision_rectangle(bbox_left, bbox_bottom - 14,
		bbox_right, bbox_bottom + 4, oFloor, true, true))
{
	versp = -15;
	doJump = false;
}

// движение
hspeed = horsp;
vspeed = versp;

// трение
if (horsp > 0)
	horsp = max(0, horsp - 0.2);
else if (horsp < 0)
	horsp = min(0, horsp + 0.2);

// дыхание
scalex = animcurve_channel_evaluate(breathe, breathePos) / 20 + 1;
scaley = scalex;
if (horsp < 0 || (!isLookingRight && horsp == 0))
	scalex *= -1;

breathePos = (breathePos + breatheSpeed) mod 1;