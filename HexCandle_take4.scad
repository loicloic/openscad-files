
$fn = 6;

s_radius = 40;
s_height = 25;


//candle(s_radius,s_height);

outer2(s_radius,s_height);

module candle(radius,height)
{
    
difference() {
    outer(radius,height);
    translate([0, 0, 8]) scale([0.90, 0.90, 1]) outer(radius,height);
    translate([0, 0, height*4]) cube([100, 100, 20], center=true);
    translate([0, 0, 6]) cylinder(h=04, r1=21,r2=21, center=true, $fn=32);
}
}



module outer2(radius,height)
{
section2();
rotate([0, 0, 75]) translate([0, 0, height/2]) section2();
//translate([0, 0, height*2]) section2();
//rotate([0, 0, 30]) translate([0, 0, height*3]) section2();
}

module section2()
{
	hull()
	{
		cylinder(h=0.001, r1=s_radius,r2=s_radius, center=true);
		rotate([0, 0, 15]) translate([0, 0, s_height/2]) cylinder(h=0.001, r1=s_radius,r2=s_radius, center=true);
	}
}






module outer(radius,height)
{
section();
rotate([0, 0, 30]) translate([0, 0, height]) section();
translate([0, 0, height*2]) section();
rotate([0, 0, 30]) translate([0, 0, height*3]) section();
}


module section()
{
	hull()
	{
		cylinder(h=0.001, r1=s_radius,r2=s_radius, center=true);
		rotate([0, 0, 30]) translate([0, 0, s_height]) cylinder(h=0.001, r1=s_radius,r2=s_radius, center=true);
	}
}