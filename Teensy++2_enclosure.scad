// Teensy++ 2 Enclosure
// Loic - Novemeber 2017

use <Teensy++2.scad>


//TODO NEED FIXING, asymetric

board_length 	= 51.2;
board_width		= 18.1;
board_height	= 1.6 + 4;	// board + usb connector
walls_depth		= 1.5;
clearance		= 0.1;		// margin for print tolerance .1mm


///////
box_length		= walls_depth + clearance + board_length + clearance + walls_depth;
box_width		= walls_depth + clearance + board_width + clearance + walls_depth;
box_height		= walls_depth + board_height;

inside_length	= clearance + board_length + clearance;
inside_width	= clearance + board_width + clearance;
inside_height	= walls_depth + board_height;


// MAIN //
box();

translate([0,-box_width - walls_depth,0])
	top_with_label();
//////////

module label()
{
	translate([6,14,2])
	rotate([180,0,0])
	linear_extrude(5)
		text("teensy", font = "wipeoutfusion", size=6.8,spacing=1.05);
}

module top_with_label()
{
	difference()
	{
		top();
		label();
	}
}

module box()
{
difference()
	{
		color("red")
			cube(size=[box_length,box_width,box_height], center=false);

		translate([walls_depth,walls_depth,walls_depth])
			cube(size=[inside_length,inside_width,inside_height], center=false);

		translate([walls_depth + clearance,walls_depth + clearance,walls_depth])
		 	teensyplusplus2();
	}
}

module top()
{
	color("blue")
		cube(size=[box_length,box_width,walls_depth], center=false);

	// tabs / rails
	color("purple")
	{
		translate([walls_depth + clearance, walls_depth + clearance,1])
			cube(size=[box_length - 2*(walls_depth + clearance),walls_depth,walls_depth*1.5], center=false);

		translate([walls_depth + clearance, box_width - 2 * (walls_depth + clearance) ,1])
			cube(size=[box_length - 2*(walls_depth + clearance),walls_depth,walls_depth*1.5], center=false);
	}
}

