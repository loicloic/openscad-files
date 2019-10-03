// Teensy++ 2 Enclosure
// Loic - Novemeber 2017


// Board Definition
// This define the specifics of your Board, ie Arduino nano, teensy.
// This module assume a micro usb connector positioned in the midle of the width on on end

board_length 		= 43.2;
board_width			= 18;
top_height			= 4;
pcb_height			= 1.6;
bottom_height		= 2;



// Box
walls_depth		= 1.5;

// Error Margin, avoid sanding
clearance		= 0.1;		// margin for print tolerance .1mm only on x and y axis

label 			= "nano";


// MAIN //
box_rounded();
translate([0,-box_width - walls_depth,0])
	top_rounded_with_label();

// board();
//box();
//translate([0,-box_width - walls_depth,0])
//	top_with_label();

//////////


font_name = "wipeoutfusion";
//font_size = 7.4;
font_size = (board_length / len(label))*0.9;		//	take a guess
font_spacing = 1.05;
label_offset = -0.5;//1.4;									//  for tweaks, because non fixed width font the i and a don't really have the same width

echo(font_size);


$fn=24;

///////
total_board_height = top_height	+ pcb_height + bottom_height;

box_length		= walls_depth + clearance + board_length + clearance + walls_depth;
box_width		= walls_depth + clearance + board_width + clearance + walls_depth;
box_height		= walls_depth + total_board_height;

inside_length	= clearance + board_length + clearance;
inside_width	= clearance + board_width + clearance;
inside_height	= walls_depth + total_board_height;


module board()
{
	connector_position = (board_width / 2) - 3.7;	// middle of the board width - half the size of the micro usb connector

	// Space taken by the components on the bottom of the board
	color("grey", alpha=0.5)
		cube(size=[board_length,board_width,bottom_height], center=false);

	// PCB height, usually constant
	color("green")
		translate([0,0,bottom_height])
		cube(size=[board_length,board_width,pcb_height], center=false);

	// Space taken by the components on the top of the board
	color("grey", alpha=0.5)
		translate([0,0,bottom_height+pcb_height])
		cube(size=[board_length,board_width,top_height], center=false);

	// Micro USB Female connector
	color("grey")
		translate([-1.5,connector_position,bottom_height+pcb_height])		//	the micro usb connector usually stick out by 1.5mm
		cube(size=[9.9,7.6,4], center=false);

	// Add dummy extension to usb port for enclosure hole
	color("grey", alpha=0.5)
		translate([-4.5,connector_position,bottom_height+pcb_height])		//	over shoot a lot on the x axis for hole in box
		cube(size=[9.9+3,7.6,4+0.1], center=false);							// cover the whole connector and overshoot a bit (0.1) on the z axis
}

module label()
{
	position = ((box_length - (len(label)*font_size)) / 2) + label_offset;
	// echo(position);

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
		 	board();
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

