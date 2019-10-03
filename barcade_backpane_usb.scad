


      color("red")
      
difference()
{
cylinder(h=6.6+4, r=35/2, center=false, $fn=60);

translate([0,0,6])
	cube(size=[16,14.4,16], center=true);
}


difference()
{
translate([-40/2,0,0])
	cylinder(h=4.2, r=16/2, center=false, $fn=60);
translate([-45/2,0,-2])
	screw_hole(16,4.2,2.7,7.7);
}

difference()
{
translate([+40/2,0,0])
	cylinder(h=4, r=16/2, center=false, $fn=60);
translate([+45/2,0,-2])
	screw_hole(16,4.2,2.7,7.7);
}
module screw_hole(height,diam,head_height,head_diam)
{
	translate([0,0,-head_height])
	{
		translate([0,0,+height])
			cylinder(h=head_height, r1=diam/2,r2=head_diam/2, center=false, $fn=20);

		translate([0,0,+head_height])
			cylinder(height-head_height,r=diam/2,center=false, $fn=20);
	}
}
