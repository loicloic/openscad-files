$fn=4;


use <Library_Triangles.scad>

//rotate([70, 0, 0]) Equilateral_Triangle(H=20);

//translate([10, 5, 20]) rotate([110, 180, 30]) Equilateral_Triangle(H=20);

base = 30;
height = 20;
width = 2;






// Reference
//ninetyDegreeCandle();

//scale([1.5,1.5,1.5])
betterCandle2(base,height);







module betterCandle2(base,height)
{


crownDiamondInTop3(base,height);
crownDiamondInBottom3(base,height);



rotate([0, 0, 30])
{
crownDiamondOutTop3(base,height);
crownDiamondOutBottom3(base,height);
}


}

module crownDiamondOutTop3(base,height)
{
shift = base/6-2;

translate([0, base-shift,0 ]) myUpTriangleOutTop2(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleOutTop2(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleOutTop2(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleOutTop2(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleOutTop2(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleOutTop2(base,heigth);
}


module crownDiamondOutBottom3(base,height)
{
shift = base/6-2;

translate([0, base-shift,0 ]) myUpTriangleOutBottom2(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleOutBottom2(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleOutBottom2(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleOutBottom2(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleOutBottom2(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleOutBottom2(base,heigth);
}

module crownDiamondInTop3(base,height)
{
shift = base/6;

translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
}


module crownDiamondInBottom3(base,height)
{
shift = base/6;

translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 60]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 120]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 240]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 300]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
}





module betterCandle(base,height)
{
crownDiamondInTop(base,height);
crownDiamondInBottom(base,height);

rotate([0, 0, 45])
{
crownDiamondOutTop(base,height);
crownDiamondOutBottom(base,height);
}
}

module crownDiamondOutTop(base,height)
{
shift = base/2 +1;

translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 90]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
rotate([0, 0, 270]) translate([0, base-shift,0 ]) myUpTriangleOutTop(base,heigth);
}


module crownDiamondOutBottom(base,height)
{
shift = base/2 +1;

translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 90]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
rotate([0, 0, 270]) translate([0, base-shift,0 ]) myUpTriangleOutBottom(base,heigth);
}

module crownDiamondInTop(base,height)
{
shift = base/2 +1;

translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 90]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
rotate([0, 0, 270]) translate([0, base-shift,0 ]) myUpTriangleInTop(base,heigth);
}


module crownDiamondInBottom(base,height)
{
shift = base/2 +1;

translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 90]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 180]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
rotate([0, 0, 270]) translate([0, base-shift,0 ]) myUpTriangleInBottom(base,heigth);
}




module diamondIn(base,heigth)
{
	myUpTriangleInBottom(base,heigth);
	myUpTriangleInTop(base,heigth);
}


module myUpTriangleInTop(base,heigth)
{	
	translate([0,0, -height +1.55])
	{
	rotate([72, 0, 0])
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
	translate([0,0, height - 1.55])
	{
	rotate([-72, 0, 0])
	{
		translate([0, 0, -width/2])
		{
		Right_Angled_Triangle(height,base/2,width);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2,width);
		}
	}
	}
}


module diamondOut(base,heigth)
{
	myUpTriangleOutTop(base,heigth);
	myUpTriangleOutBottom(base,heigth);
}

module myUpTriangleOutTop2(base,heigth)
{	
	translate([0,-0.1, -.35])
	{
	rotate([84.1, 0, 0])
	{
		translate([0, 0, -width/2])
		{
			Right_Angled_Triangle(height,base/2+1.2,width);
			mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2+1.2,width);
		}
	}
	}
}

module myUpTriangleOutBottom2(base,heigth)
{	
	translate([0,0, .35])
	{
	rotate([-84.1, 0, 0])
	{
		translate([0, 0, -width/2])
		{
		Right_Angled_Triangle(height,base/2+1.2,width);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2+1.2,width);
		}
	}
	}
}


module myUpTriangleOutTop(base,heigth)
{	
	translate([0,0, -.35])
	{
	rotate([72, 0, 0])
	{
		translate([0, 0, -width/2])
		{
			Right_Angled_Triangle(height,base/2,width);
			mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2,width);
		}
	}
	}
}


module myUpTriangleOutBottom(base,heigth)
{	
	translate([0,0, .35])
	{
	rotate([-72, 0, 0])
	{
		translate([0, 0, -width/2])
		{
		Right_Angled_Triangle(height,base/2,width);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2,width);
		}
	}
	}
}






module ninetyDegreeCandle()
{
bobby(base,height);

translate([0, 0, (base/2)+3.5])
rotate([0, 0, 45])
bobby(base,height);

translate([0, 0, (base)+7])
bobby(base,height);

translate([0, 0, (base*2)-4.5])
rotate([0, 0, 45])
bobby(base,height);
}




module bobby(base,height)
{
crown3(base,height);
crown4(base,height);
}

module bobby2(base,height)
{
crown5(base,height);
crown6(base,height);
}



module crown3(base,height)
{
translate([0, base/2-2,0 ]) myUpTriangle3(base,heigth);
rotate([0, 0, 90]) translate([0, base/2-2,0 ]) myUpTriangle3(base,heigth);
rotate([0, 0, 180]) translate([0, base/2-2,0 ]) myUpTriangle3(base,heigth);
rotate([0, 0, 270]) translate([0, base/2-2,0 ]) myUpTriangle3(base,heigth);
}

module crown4(base,height)
{
translate([0, base/2,0 ]) myUpTriangle4(base,heigth);
rotate([0, 0, 90]) translate([0, base/2,0 ]) myUpTriangle4(base,heigth);
rotate([0, 0, 180]) translate([0, base/2,0 ]) myUpTriangle4(base,heigth);
rotate([0, 0, 270]) translate([0, base/2,0 ]) myUpTriangle4(base,heigth);
}








module myUpTriangle3(base,heigth)
{	
	rotate([-72, 0, 0])
	{
		Right_Angled_Triangle(height,base/2,2);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2,2);
	}
}


module myUpTriangle4(base,heigth)
{	
	rotate([72, 0, 0])
	{
		Right_Angled_Triangle(height,base/2,2);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2,2);
	}
}








/*
translate([0, 0, height])
ring(base,height);

rotate([0,0, 22.5])
ring(base,height);
*/

module ring(base,height)
{
crown(base,height);
crown2(base,height);
}



module crown(base,height)
{
quarter(base,height);

rotate([0, 0, 90])
quarter(base,height);

rotate([0, 0, 180])
quarter(base,height);

rotate([0, 0, 270])
quarter(base,height);
}

module quarter(base,height)
{
//translate([0, base+5.477, ])
//myUpTriangle(base,heigth);

rotate([0, 0, 45])
{
translate([0, base+5.477, ])
myUpTriangle(base,heigth);
}

rotate([0, 0, 90])
{
translate([0, base+5.477, ])
myUpTriangle(base,heigth);
}
}

module myUpTriangle(base,heigth)
{	
	rotate([85, 0, 0])
	{
		Right_Angled_Triangle(height,base/2);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2);
	}
}


module crown2(base,height)
{
quarter2(base,height);

rotate([0, 0, 90])
quarter2(base,height);

rotate([0, 0, 180])
quarter2(base,height);

rotate([0, 0, 270])
quarter2(base,height);
}

module quarter2(base,height)
{
//translate([0, base+4.477, ])
//myUpTriangle2(base,heigth);

rotate([0, 0, 45])
{
translate([0, base+4.477, ])
myUpTriangle2(base,heigth);
}

rotate([0, 0, 90])
{
translate([0, base+4.477, ])
myUpTriangle2(base,heigth);
}
}

module myUpTriangle2(base,heigth)
{	
	rotate([275, 0, 0])
	{
		Right_Angled_Triangle(height,base/2);
		mirror([90, 0, 0]) Right_Angled_Triangle(height,base/2);
	}
}
