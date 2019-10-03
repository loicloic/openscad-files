/* Loic - August 2017 - Arduino Nano Clone */

// ToDo: Pins are likely too loing and do not "center Correctly"
// ToDo: Double Check, Size & position of Micro USB Connector + "boolean" space (for difference) ?
// ToDo: Chips and underside passives ?



// Can set if you want header pins, up, down or none as well as isp pins

arduino_nano(center=true);
//arduino_nano(center=true,isp=true,left_pins=true,right_pins=true,pins_bottom=false);




////////////////////////////////////////////

// Size Constants
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


module arduino_nano(center=true,isp=true,left_pins=true,right_pins=true,pins_bottom=true,micro_usb=true)
{

  if (center == true)
  {
    translate([-pcb_width/2,pcb_length-(pcb_length/2),pcb_height])
      nano_helper(center,isp,left_pins,right_pins,pins_bottom,micro_usb);
  }
  else
  {
    translate([0,pcb_length,pcb_height])
      nano_helper(center,isp,left_pins,right_pins,pins_bottom,micro_usb);
  }
}

module nano_helper(center=true,isp=true,left_pins=true,right_pins=true,pins_bottom=true,micro_usb=true)
{
      rotate([0,180,180])
      {
        pcb();

        if (micro_usb)
        {
          translate([pcb_width/2,pcb_length-2,-pcb_height])
          micro_usb();
        }

        if (isp)
          isp_pins();

        if (right_pins)
        {
          if (pins_bottom)
          {
            translate([tab_width/2,2.6+tab_width/2,pcb_height]) pins_rail(15);
          }
          else
          {
            rotate([0,180,0])
            {
              translate([-tab_width/2,2.6+tab_width/2,0]) pins_rail(15);
            }
          }
        }

        if (left_pins)
        {
          if (pins_bottom)
          {
            translate([pcb_width-tab_width/2,2.6+tab_width/2,pcb_height]) pins_rail(15);
          }
          else
          {
            rotate([0,180,0])
            {
              translate([-pcb_width+tab_width/2,2.6+tab_width/2,0]) pins_rail(15);
            }
          }
        }
      }
}

module micro_usb()
{
  rotate([180,0,0])
  {
    cube([7,10,2.1],true);
    translate([0,0,1.9])
        cube([8,10,2.1],true);
  }
}

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

module isp_pins()
{
  translate([pcb_width/2+(tab_width),tab_width*3,pcb_height])
  rotate([0,180,90])
  {
    translate([tab_width/2,0,pin_short/2-pcb_height])
    {
      pins_rail(3);
      translate([tab_width,0,0])
        pins_rail(3);
    }
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