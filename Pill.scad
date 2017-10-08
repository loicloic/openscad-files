/* Pill Object, Loic August 2017 */

//pill(200,10);

module pill(height,width)
{
       move = (height - width) / 2;
       cyl_height = height - width;
       cyl_move = -move;
    
    hull()
    {
        translate([0,0,-move]) 
            sphere(width/2);

        translate([0,0,move]) 
            sphere(width/2);
    }
}
