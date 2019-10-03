/* Block Strap  - Loic Septemeber 2017 */

// ToDo: Clean up, variable and module better naming

height = 3;
depth = 15;

holder_length = 54;
holder_height = 137;
bracket_length = 10;

with_screw_holes = true;

screw_hole_top_depth = 6;
screw_hole_bottom_depth = 4;

//////////
difference()
{
cable_strap_base();

if(with_screw_holes)
    {
    translate([0,-bracket_length-holder_length/2 +1,-0.1])
      color("red")
      cylinder(height+0.2,screw_hole_bottom_depth/2,screw_hole_top_depth/2,$fn=12);
    
    translate([0,bracket_length + holder_length/2 - 1,-0.1])
      color("red")
      cylinder(height+0.2,screw_hole_bottom_depth/2,screw_hole_top_depth/2,$fn=12);
    }
}


/////////////
// Helper Modules
module cable_strap_base()
{   
    radius = depth / 2;
    offset = bracket_length + holder_length/2;
    translate([0,-offset,0])
    {
        cylinder(height,radius,radius);
        translate([-depth/2,0,0])
            cube([depth,bracket_length+1,height]);
        
        translate([0,bracket_length+(holder_length/2)])
        {
            holder(holder_length,holder_height,depth,height);   
        }
        
        translate([-depth/2,bracket_length+holder_length-1,0])
            cube([depth,bracket_length+1,height]);
        
        translate([0,2*bracket_length+holder_length,0])
            cylinder(height,radius,radius);
    }
}

module holder(length,height,depth,width)
{
    difference()
    {
        cube([depth,length,height*2],true);
        cube([depth+2,length-width*2,height*2-width*2],true);
        translate([0,0,-height])
            cube([depth+2,length+2,height*2],true);
    }
    
}
