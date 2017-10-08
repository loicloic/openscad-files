/* Loic, August 2017 */


include <CurvedRectangle.scad>

usb_logo(5,50);


module usb_logo(height,length)
{
    
center = -length/2;
bob = length*0.04;

translate([0,center,0])
{
    ///////////
    // Main Arm
    ///////////
    
    // Main Arm Circle
    translate([0,(length*0.095),0])
        cylinder(height,length*0.095,length*0.095,$fn=40,false);

    translate([-length*0.02,length*0.05,0])
        cube([length*0.04,length*0.85,height]);


    translate([0,length,0])
    rotate(a=[0,0,-135])
        linear_extrude(height, center = false, convexity = 12, twist = 0)
            polygon(points=[[0,0],[length*0.12,length*0.04],[length*0.04,length*0.12]], paths=[[0,1,2]]);


    /////////////
    // Circle Arm
    /////////////
    
   translate([-length*0.076,length*0.235,0]) 
   rotate([0,0,225])
      curved_rectangle(height, Dout=bob*4.95, Din=bob*2.95, StartAngle=60, EndAngle=90, Faces=50); 
    
    translate([-length*0.027,length*0.268,0])
    rotate([0,0,45])
        cube([length*0.04,length*0.205,height]);
        
    translate([-length*0.099,length*0.48,0]) 
        curved_rectangle(height, Dout=bob*4.95, Din=bob*2.95, StartAngle=90, EndAngle=135, Faces=50); 
    
    translate([-length*0.198,length*0.48,0])
        cube([length*0.04,length*0.2,height]);
    
    // Circle Arm's Circle
    translate([-length*0.18,length*0.63,0])
        cylinder(height,length*0.06,length*0.06,$fn=40);


    /////////////
    // Square Arm
    /////////////
    
        
   translate([length*0.072,length*0.392,0]) 
   rotate([0,0,338])
      curved_rectangle(height, Dout=bob*4.95, Din=bob*2.95, StartAngle=60, EndAngle=90, Faces=50); 
    
    
    translate([length*0.0028,length*0.463,0])
    rotate([0,0,-45]) 
        cube([length*0.04,length*0.185,height]);
    
    translate([length*0.088,length*0.632,0]) 
    rotate([0,0,215])
        curved_rectangle(height, Dout=bob*4.95, Din=bob*2.95, StartAngle=10, EndAngle=50, Faces=50); 
        
    translate([length*0.146,length*0.618,0])
        cube([length*0.04,length*0.1,height]);
        
    translate([length*0.106,length*0.7,0])
        cube([length*0.11,length*0.11,height]);

}

}