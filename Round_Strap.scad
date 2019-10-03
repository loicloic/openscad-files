/* Cable Strap  - Loic Septemeber 2017 */

// ToDo: More work

height = 2;
depth = 10;

loop_length = 20;
bracket_length = 10;

with_screw_holes = true;

screw_hole_top_depth = 6;
screw_hole_bottom_depth = 4;

//////////
radius = depth / 2;




difference()
{
cable_strap_base();

if(with_screw_holes)
    {
    translate([0,-bracket_length-loop_length/2 +1,-0.1])
      color("red")
      cylinder(height+0.2,screw_hole_bottom_depth/2,screw_hole_top_depth/2,$fn=12);
    
    translate([0,bracket_length + loop_length/2 - 1,-0.1])
      color("red")
      cylinder(height+0.2,screw_hole_bottom_depth/2,screw_hole_top_depth/2,$fn=12);
    }
}



// Helper Modules
module cable_strap_base()
{
    bob = bracket_length + loop_length/2;
    translate([0,-bob,0])
    {
        cylinder(height,radius,radius);
        translate([-depth/2,0,0])
            cube([depth,bracket_length+1,height]);
        
        translate([0,bracket_length+(loop_length/2)])
        {
        rotate([-90,0,90])
            half_ring(loop_length/2,loop_length/2-height*1.2,depth);   
        }
        
        translate([-depth/2,bracket_length+loop_length-1,0])
            cube([depth,bracket_length+1,height]);
        
        translate([0,2*bracket_length+loop_length,0])
            cylinder(height,radius,radius);
    }
}

module half_ring(outer_r,inner_r,depth)
{
    difference()
    {
    ring(outer_r,inner_r,depth);
    
    translate([0,outer_r/2,0])
        cube([2+outer_r*2,outer_r,depth*2],true);
    }
}

module ring(outer_r,inner_r,depth)
{
    translate([0,0,-depth/2])
    {
        difference()
        {
            cylinder(depth,outer_r,outer_r);
            translate([0,0,-2])
                cylinder(depth+4,inner_r,inner_r);
        }
    }
}