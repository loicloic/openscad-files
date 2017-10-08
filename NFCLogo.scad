/* NFC Like Logo */
/* Loic - August 2017 */

nfc_logo(16,5);

module nfc_logo(diam,height)
{
    cylinder(height,3,3,$fn=40);
    waves2(height,diam/2);
    waves2(height,diam*0.75);
    waves2(height,diam);
}

module waves2(height,ext_diam)
{
    //height = 2;
    //ext_diam = 10;
    
    faces = 40;
    int_diam = ext_diam - 2;
    rect_len = 2.4 * ext_diam;
    rect_height = 3 * height;
    
    difference()
    {
        difference()
        {
            cylinder(height,ext_diam,ext_diam,$fn=faces);
            translate([0,0,-1])
              cylinder(height+2,int_diam,int_diam,$fn=faces);
        }
        
        cube([rect_len,ext_diam*0.4,rect_height],true);
        
        rotate(20)
        cube([rect_len,ext_diam*0.4,rect_height],true);
        rotate(-20)
        cube([rect_len,ext_diam*0.4,rect_height],true);
    }
}
