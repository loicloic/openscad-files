$fn=4;


use <Library_Triangles.scad>

//rotate([70, 0, 0]) Equilateral_Triangle(H=20);

//translate([10, 5, 20]) rotate([110, 180, 30]) Equilateral_Triangle(H=20);

base = 40;
height = 25;
width = 4;





difference()
{
betterCandle2(base,height);
translate([0,0,-height+2])
cube(size=[base*3,base*3,5], center=true);

}


//translate([0,0,2*height-width*1.5])
//	betterCandle2(base,height);


difference()
{
translate([0,0,47])
rotate([0, 0, 60])
betterCandle2(base,height);

translate([0,0,4*height])
cube(size=[base*3,base*3,60], center=true);
}


base();


module base()
{
difference()
{
bottom();
translate([0, 0, -height+7])
cylinder(h=20, r1=20.5, r2=20.5, center=false, $fn=20);
}
}


module bottom()
{


bottomPart(base,height);

rotate([0,0,60])
bottomPart(base,height);

rotate([0,0,120])
bottomPart(base,height);

rotate([0,0,180])
bottomPart(base,height);

rotate([0,0,240])
bottomPart(base,height);

rotate([0,0,300])
bottomPart(base,height);
}

module bottomPart(base,heigth)
{	

	rotate([0,0,30])
	translate([0,0,-height+width*1.5+2])
	cube([base*2,base-1,width*1.5],center=true);

	rotate([0,0,30])
	translate([0,0,-height+width*1.5+2])
	cube([base/8,base*2.2,width*1.5],center=true);
}




module betterCandle2(base,height)
{
crownDiamondInTop(base,height);
crownDiamondInBottom(base,height);


rotate([0, 0, 30])
{
crownDiamondOutTop(base,height);
crownDiamondOutBottom(base,height);
}




}

module crownDiamondOutTop(base,height)
{
shift = width*2;

base = base + width*2;
height = height + width*1.5;

translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
}


module crownDiamondOutBottom(base,height)
{
shift = width*2;

base = base + width*2;
height = height + width*1.5;

translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
}

module crownDiamondInTop(base,height)
{
shift = 2*width-0.3;

base = base + width*1.5;
height = height + width*1.5;

translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
}


module crownDiamondInBottom(base,height)
{
shift = 2*width;

base = base + width*1.5;
height = height + width*1.5;

translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
}




module myUpTriangleInTop(base,heigth)
{	
	translate([0,0, -height +((width/2)*1.5)])
	{
	rotate([70, 0, 0])
	{
		translate([0, 0, -width/2])
		{
			Right_Angled_Triangle(height,base/2,width);
			mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2,width);
		}
	}
	}
}

module myUpTriangleInBottom(base,heigth)
{	
	translate([0,0, height - 1.5])
	{
	rotate([-70, 0, 0])
	{
		translate([0, 0, -width/2])
		{
		Right_Angled_Triangle(height,base/2,width);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2,width);
		}
	}
	}
}

module myUpTriangleOutTop(base,heigth)
{	
	translate([0,-0.1, -.35])
	{
	rotate([80.5, 0, 0])
	{
		translate([0, 0, -width/2])
		{
			Right_Angled_Triangle(height,base/2+1.2,width);
			mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2+1.2,width);
		}
	}
	}
}

module myUpTriangleOutBottom(base,heigth)
{	
	translate([0,0, .35])
	{
	rotate([-80.5, 0, 0])
	{
		translate([0, 0, -width/2])
		{
		Right_Angled_Triangle(height,base/2+1.2,width);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2+1.2,width);
		}
	}
	}
}


