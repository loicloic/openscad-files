

difference ()
{
cylinder(6.7,d=35,$fn=40);
translate([0,0,-2])
cylinder(20,d=31,$fn=40);
}


difference ()
{
cylinder(6.7,d=35,$fn=40);

smaller_honey(); 
}


module smaller_honey()
{
  scale(0.8)
  honey(); 

}







module honey()
{
lot_hex();
translate([0,40,0])
lot_hex();
translate([0,-40,0])
lot_hex();
  
translate([-52,0,0])
lot_hex();
  
translate([-52,40,0])
lot_hex();
  
translate([-52,-40,0])
lot_hex();
}

module lot_hex()
{
nine_hex();

translate([19.5,4,0])
nine_hex();

translate([-19.5,4,0])
nine_hex();

translate([-19.5,-12,0])
nine_hex();

translate([19.5,-12,0])
nine_hex();

translate([0,-16,0])
nine_hex();
}

module nine_hex()
{
three_hex();

translate([6.5,4,0])
  three_hex();

translate([-6.5,4,0])
  three_hex();
}

module three_hex()
{
  hex();

translate([0,8,0])
hex();

translate([0,-8,0])
hex();

}


/*
translate([6.5,3.5,0])
{
  rotate([0,0,180])
  hex();
}
*/
//translate([0,8,0])
 // hex();
  
  
module hex()
{
difference()
{
  //cylinder(20,d=10,$fn=6);
  translate([0,0,-30])
    cylinder(60,d=8,$fn=6);
}
}
