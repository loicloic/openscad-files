/* Loic - August 2017 */

diam = 20.5;

use <Pill.scad>


difference()
{
rotate([90,0,0])
    pill(31,21);

translate([0,0,-15.25])
    cube([40,40,30.5],true);
}


difference()
{
translate([0,-5,-12])
    cylinder(12,8.65,8.65);

translate([0,-5,-16])
    cylinder(16,6.65,6.65);
    
translate([0,4.5,-16])
    cylinder(16,9,9);
}


module foot(size)
{
difference()
{
union()
{
translate([size/3,0,-size/3]) 
    sphere(size/2);

translate([size/3,0,-size/5]) 
    sphere(size/2);

translate([size/3,0,-size/15]) 
    sphere(size/2);

translate([size/3,0,size/15]) 
    sphere(size/2);

translate([size/3,0,size/5]) 
    sphere(size/2);

translate([size/3,0,size/3]) 
    sphere(size/2);

cube([size/15*10,size,size/15*12],true);
}

translate([0,0,-size/15*21]) 
    cube([size*2,size*2,size*2],true);

translate([0,0,size/15*21]) 
    cube([size*2,size*2,size*2],true);

translate([-size,0,0]) 
sphere(size);
}
}