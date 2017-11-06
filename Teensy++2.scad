// Teensy++ 2 
// Loic - Novemeber 2017


teensyplusplus2();

board_length 	= 51.2;
board_width		= 18.1;
board_height	= 1.6;	// board + usb connector

// reset button
module resetButton()
{
	color("grey")
		cube(size=[3,4,1], center=false);

	translate([1.5,2,1])
	color("black")
		cylinder(h=0.5, r=1, center=false, $fn=20);
}

module microUSBConnector()
{
	cube(size=[9.9 + 5,7.6,4], center=false);	// + 5 is dummy long for thick wall
}

//board
module teensyplusplus2()
{
	color("green")
		cube(size=[board_length,board_width,board_height], center=false);

	translate([45,9.05-2,board_height])
		resetButton();

	translate([-5,5.25,1.61])
		microUSBConnector();
}