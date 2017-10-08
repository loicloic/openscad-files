/* Loic - August 2017 - Arduino Nano Clone */

pcb_width = 18;
pcb_length = 43;
pcb_height = 1.4;

screwHole_radius = 0.8;
screwHole_margin = 0.5;
$fn=8;

  pin_height = 11.2;
  pin_width = 0.62;
  pin_short=5.4;
  
  tab_height = 2.4;
  tab_width = 2.52;

module pcb()
{
difference()
{
color("DarkBlue")
  cube([pcb_width,pcb_length,pcb_height]);

translate([screwHole_radius+screwHole_margin,screwHole_radius+screwHole_margin,-pcb_height/2])
  screwHole();
translate([screwHole_radius+screwHole_margin,pcb_length-screwHole_radius-screwHole_margin,-pcb_height/2])
  screwHole();
translate([pcb_width-screwHole_radius-screwHole_margin,pcb_length-screwHole_radius-screwHole_margin,-pcb_height/2])
  screwHole();
translate([pcb_width-screwHole_radius-screwHole_margin,screwHole_radius+screwHole_margin,-pcb_height/2])
  screwHole();
}
}

pcb();
//pin();

translate([tab_width/2,2.6+tab_width/2,pcb_height])
pins_rail(15);

  translate([pcb_width-tab_width/2,2.6+tab_width/2,pcb_height])
 pins_rail(15);

//rotate([0,0,90])
//isp_pins();

module isp_pins()
{
  translate([tab_width/2,0,pin_short/2-pcb_height])
  {
pins_rail(3);
  translate([tab_width,0,0])
pins_rail(3);
  }
}

module pins_rail(numbersOfPin)
{
  for (i=[0:numbersOfPin-1])
    translate([0,i*tab_width,0])
      pin();
}

module pin()
{
  translate([0,0,tab_height/2])
    color("black")
      cube([tab_width,tab_width,tab_height],true);
  
  translate([0,0,pin_height-pin_short-tab_height])
    color("gold")
      cube([pin_width,pin_width,pin_height],true);
}

module screwHole()
{
  cylinder(pcb_height*2,screwHole_radius,screwHole_radius);
}