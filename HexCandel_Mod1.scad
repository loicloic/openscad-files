
$fn = 6;


mike();



module mike()
{
section();
rotate([0, 0, 30]) translate([0, 0, s_height]) section();
translate([0, 0, s_height*2]) section();
rotate([0, 0, 30]) translate([0, 0, s_height*3]) section();
}


s_radius = 40;
s_height = 25;



module section()
{
	hull()
	{
		cylinder(h=0.001, r1=s_radius,r2=s_radius, center=true);
		rotate([0, 0, 30]) translate([0, 0, s_height]) cylinder(h=0.001, r1=s_radius,r2=s_radius, center=true);
	}
}


/*
difference() {
mike();
translate([0, 0, 2]) scale([0.90, 0.9, 1]) mike();

translate([0, 0, 20]) cube([100, 100, 1], center=true);

}


module mike()
{
bob();
rotate([0, 0, 30]) translate([0, 0, 5]) bob();
translate([0, 0, 10]) bob();
rotate([0, 0, 30]) translate([0, 0, 15]) bob();
}


module bob()
{
hull() {
cylinder(h=0.001, r1=10,r2=10, center=true);




rotate([0, 0, 30]) translate([0, 0, 5]) cylinder(h=0.001, r1=10,r2=10, center=true);
}


}
*/