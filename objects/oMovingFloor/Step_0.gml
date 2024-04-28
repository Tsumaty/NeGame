/// @desc движение по алгоритму
if (maxhorsp > 0)
    horsp = min(maxhorsp, horsp + horAccelRate);
else if (maxhorsp < 0)
    horsp = max(maxhorsp, horsp - horAccelRate);

if (maxversp > 0)
    versp = min(maxversp, versp + verAccelRate);
else if (maxversp < 0)
    versp = max(maxversp, versp - verAccelRate);

/*var creat = instance_place(x, y - 3, oCreature); // существо, которое стоит на этой платформе
if (creat && bbox_top > creat.bbox_bottom && creat.vspeed >= 0)
{
    creat.onPlatform = true;
    creat.versp = 0;
    creat.vspeed = 0;
    creat.x += horsp;
    creat.y += versp;
}*/

hspeed = horsp;
vspeed = versp;

if (horsp > 0)
    horsp = max(0, horsp - horAccelRate / 2);
else if (horsp < 0)
    horsp = min(0, horsp + horAccelRate / 2);

if (versp > 0)
    versp = max(0, versp - verAccelRate / 2);
else if (versp < 0)
    versp = min(0, versp + verAccelRate / 2);

if (surface)
{
    surface.x = x;
    surface.y = y;
}