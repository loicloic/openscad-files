// Teensy++ 2 Enclosure
// Loic - Novemeber 2017

use <Teensy++2.scad>


//TODO NEED FIXING, asymetric

board_length 	= 51.2;
board_width		= 18.1;
board_height	= 1.6 + 4;	// board + usb connector
walls_depth		= 1.5;
clearance		= 0.1;		// margin for print tolerance .1mm

label 			= "teensy";


// MAIN //

box_rounded();
translate([0,-box_width - walls_depth,0])
	top_rounded_with_label();

//box();
//translate([0,-box_width - walls_depth,0])
//	top_with_label();

//////////

font_name = "wipeoutfusion";
font_size = 7.8;
font_spacing = 1.05;

$fn=24;

///////
box_length		= walls_depth + clearance + board_length + clearance + walls_depth;
box_width		= walls_depth + clearance + board_width + clearance + walls_depth;
box_height		= walls_depth + board_height;

inside_length	= clearance + board_length + clearance;
inside_width	= clearance + board_width + clearance;
inside_height	= walls_depth + board_height;


module label()
{
	position = ((box_length - (len(label)*font_size)) / 2) - walls_depth;
	echo(position);
	// position = (len(label) * font_size) / 6.8;

	translate([position,(box_width/2)+(font_size/2.4),walls_depth*2])
	rotate([180,0,0])
	linear_extrude(walls_depth * 4)
		text(label, font = font_name, size=font_size,spacing=font_spacing);
}

module box_rounded()
{
	difference()
	{
		box_rounded_outside();
		inner_space();
	}
}

module box_rounded_outside()
{
hull()
	{
		translate([walls_depth,walls_depth ,0 ])
			cylinder(box_height, walls_depth, walls_depth, center=false );

		translate([box_length-walls_depth,walls_depth ,0 ])
			cylinder(box_height, walls_depth, walls_depth, center=false);

		translate([box_length-walls_depth, box_width-walls_depth,0 ])
			cylinder(box_height, walls_depth, walls_depth, center=false);

		translate([walls_depth,box_width - walls_depth ,0 ])
			cylinder(box_height, walls_depth, walls_depth, center=false);
	}
}

module top_rounded()
{
hull()
	{
		translate([walls_depth,walls_depth ,0 ])
			cylinder(walls_depth, walls_depth, walls_depth, center=false);

		translate([box_length-walls_depth,walls_depth ,0 ])
			cylinder(walls_depth, walls_depth, walls_depth, center=false);

		translate([box_length-walls_depth, box_width-walls_depth,0 ])
			cylinder(walls_depth, walls_depth, walls_depth, center=false);

		translate([walls_depth,box_width - walls_depth ,0 ])
			cylinder(walls_depth, walls_depth, walls_depth, center=false);
	}
	// tabs / rails
	color("purple")
	{
		translate([walls_depth + clearance, walls_depth + clearance,1])
			cube(size=[box_length - 2*(walls_depth + clearance),walls_depth,walls_depth*1.5], center=false);

		translate([walls_depth + clearance, box_width - 2 * (walls_depth + clearance) ,1])
			cube(size=[box_length - 2*(walls_depth + clearance),walls_depth,walls_depth*1.5], center=false);
	}
}

module top_rounded_with_label()
{
	difference() 
	{
		top_rounded();
		label();
	}
}

module inner_space()
{
		translate([walls_depth,walls_depth,walls_depth])
			cube(size=[inside_length,inside_width,inside_height], center=false);

		translate([walls_depth + clearance,walls_depth + clearance,walls_depth])
		 	teensyplusplus2();
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

		inner_space();
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

