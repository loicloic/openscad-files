/* Loic - August 2017 */

use <NFCLogo.scad>

pin_diam = 1.4;
pin_height = 2.5;

difference()
{
    cube([44,64,2],true);

   
    translate([0,4,-2])
        nfc_logo(16,20);
    
   translate([0,-29.5,+1])
        cube([22,4,2],true);

       translate([-19.5,-22.5,+1])
        cube([4,10,2],true);

}

translate([22-pin_diam-7,32-pin_diam-7,0])
    cylinder(pin_height,pin_diam,pin_diam,$fn=30);

translate([-22+pin_diam+7,32-pin_diam-7,0])
    cylinder(pin_height,pin_diam,pin_diam,$fn=30);

translate([-22+pin_diam+3,-32+pin_diam+16,0])
    cylinder(pin_height*2,pin_diam,pin_diam,$fn=30);

translate([22-pin_diam-3,-32+pin_diam+16,0])
    cylinder(pin_height*2,pin_diam,pin_diam,$fn=30);