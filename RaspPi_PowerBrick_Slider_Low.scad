

base_length = 23.7;
base_width = 35.3;
base_height = 1.8;

button_length = 10.5;
button_width = 10.5;
button_pin_length = 6;
button_pin_width = 3.8;
button_pin_height = 4.9;

raiser_height = 8.7;
raiser_length = 1.2;

bump_height = 2.4;
bump_width = base_width;
bump_length = 1.8;

back_length = 15;

// base
difference()
{
	color("blue")
		cube(size=[base_length, base_width, base_height], center=false);

	// button cut out
	translate([(base_length-button_length-2)/2,4.8,-2])
		cube(size=[button_length+2, button_width+1, base_height+4], center=false);
}

// button
translate([(base_length-button_length)/2,5.8,0])
{
	color("pink")
	{
		cube(size=[button_length, button_width, base_height], center=false);

		translate([(button_length-button_pin_length)/2,0,0])
			cube(size=[button_pin_length, button_pin_width, button_pin_height], center=false);
	}
}

// raiser
cube(size=[raiser_length,base_width,raiser_height], center=false);
translate([base_length-raiser_length,0,0])
	cube(size=[raiser_length,base_width,raiser_height], center=false);


// bump
translate([-raiser_length,0,6.3])
	cube(size=[bump_length,bump_width,bump_height], center=false);

translate([-raiser_length+base_length,0,6.3])
	cube(size=[bump_length,bump_width,bump_height], center=false);
//translate([base_length-raiser_length,0,0])
//	cube(size=[raiser_length,base_width,raiser_height], center=false);


// back
translate([(base_length-back_length)/2,0,0])
	cube(size=[back_length,bump_length,8.7], center=false);

// front
translate([(base_length-back_length)/2,base_width-bump_length,0])
	cube(size=[back_length,bump_length,8.7], center=false);

// rails
color("pink")
translate([4,0,0])
	cube(size=[bump_length,bump_width,8.7], center=false);

color("blue")
translate([base_length-4-bump_length,0,0])
	cube(size=[bump_length,bump_width,8.7], center=false);


