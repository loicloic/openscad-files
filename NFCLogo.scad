/* NFC Like Logo */
/* Loic - August 2017 */

nfc_logo(16,5);

module nfc_logo(diam,height)
{
    cylinder(height,diam/5.33,diam/5.33,$fn=40);
    waves(height,diam*0.5,diam/8);
    waves(height,diam*0.75,diam/8);
    waves(height,diam,diam/8);
}

module waves(height,ext_diam,spacing)
{
    $fn = 40;
    int_diam = ext_diam - spacing;
    rect_len = 2.4 * ext_diam;
    rect_height = 3 * height;
    
    difference()
    {
        difference()
        {
            cylinder(height,ext_diam,ext_diam);
            translate([0,0,-1])
              cylinder(height+2,int_diam,int_diam);
        }
        
        cube([rect_len,ext_diam*0.4,rect_height],true);
        
        rotate(20)
            cube([rect_len,ext_diam*0.4,rect_height],true);
        rotate(-20)
            cube([rect_len,ext_diam*0.4,rect_height],true);
    }
}
