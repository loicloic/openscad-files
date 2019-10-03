
$fn=20;

// positive / key like, used for boolean operation

length 	= 14;
width 	= 14;
height  = 1;

pin_diam = 2;
peg_diam = 2.6;

pin_height = 4.2;

center_pin_diam = 4.6;


difference()
{
	cube(size=[length*1.25,width*1.25,height], center=false);
	rotate([180,0,0])
	translate([length*0.125,-width*1.125,-2*height])
	cherry_key();
}

module cherry_key()
{
cube(size=[length,width,height], center=false);

translate([4.2,width-2.2,0])
// contact pin 1
cylinder(h=pin_height, r1 = pin_diam/2, r2 = pin_diam/2, center=false);

translate([length-3.2,width-4.3,0])
// contact pin 2
cylinder(h=pin_height, r1 = pin_diam/2, r2 = pin_diam/2, center=false);


translate([2,width/2,0])
// left pin
cylinder(h=pin_height, r1 = peg_diam/2, r2 = peg_diam/2, center=false);

translate([length/2,width/2,0])
// Center pin
cylinder(h=pin_height, r1 = center_pin_diam/2, r2 = center_pin_diam/2, center=false);

translate([length-2,width/2,0])
// right pin
cylinder(h=pin_height, r1 = peg_diam/2, r2 = peg_diam/2, center=false);
}
