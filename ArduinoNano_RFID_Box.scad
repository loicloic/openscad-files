module micro_usb()
{
    cube([7,10,2.1],true);
    translate([0,0,1.9])
        cube([8,10,2.1],true);
}


module box()
{
    difference()
    {
        cube([45,64,13],true);
        translate([0,0,1])
            cube([41,60,13],true);
    }
}

difference()
{
box();
translate([0,30,0])
    micro_usb();
pinhole();
}

module pinhole()
{
    translate([-30,-15,1])
    rotate([90,0,90])
    cylinder(20,true,$fn=12);
}