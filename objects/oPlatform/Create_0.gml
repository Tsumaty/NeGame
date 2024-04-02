image_speed = 0;
var usualFloor = instance_create_depth(-1000, -1000, 0, oFloor);
frictForce = usualFloor.frictForce;
instance_destroy(usualFloor);