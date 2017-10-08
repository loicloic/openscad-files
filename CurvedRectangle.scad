/* Adapted from: http://forum.openscad.org/partial-rotate-extrude-td2695.html */

module curved_rectangle(Height,Dout,Din,StartAngle,EndAngle,Faces)
{ 
    
    StartAngle= (StartAngle < 0) ? 360+StartAngle : StartAngle; 
    EndAngle= (EndAngle < 0) ? 360+EndAngle : EndAngle; 
    EndAngle2 =  (EndAngle < StartAngle) ? StartAngle : EndAngle; 
    StartAngle2 =  (EndAngle < StartAngle) ? EndAngle : StartAngle; 
    
    if (EndAngle2-StartAngle2<360)
    { 
        
        NSides= (Faces < 3 || Faces==undef)  ?  DefaultFaces : Faces; 
        n=floor((EndAngle2-StartAngle2)/120); 
        Sect1=EndAngle2-StartAngle2-n*120; 
        Sect2= (n>0) ? 120 : 0; 
        Sect3=(n>1) ? 120 : 0; 
        
        intersection()
        { 
        rotate_extrude(convexity=2, $fn=floor(NSides*360/(EndAngle2-StartAngle2))) 
        translate([Din/2,0,0])
            square([(Dout-Din)/2,Height]); 
        
            union()
            { 
                hull()
                { 
                    rotate(StartAngle2)
                        cube([0.001,Dout,Height+1]); 
                    rotate((StartAngle2+Sect1))
                        cube([0.001,Dout,Height+1]); 
                } 
                hull()
                { 
                    rotate((StartAngle2+Sect1)) cube([0.001,Dout,Height+1]); 
                    rotate((StartAngle2+Sect1+Sect2)) cube([0.01,Dout,Height+1]); 
                } 
                hull()
                { 
                    rotate((StartAngle2+Sect1+Sect2))
                        cube([0.001,Dout,Height+1]); 
                    rotate((StartAngle2+Sect1+Sect2+Sect3))
                        cube([0.001,Dout,Height+1]); 
                }
            }	
        } 
    } 
    else
    { 
        echo("Only rotations less than 360 degrees are supported");
    } 
} 