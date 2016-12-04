//
// ktBOX1
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;
front_x = 95+5+panel_thick*2;
front_y = 72+0.5+panel_thick*2;
front_z = 25+panel_thick;
rear_x = front_x;
rear_y = front_y;
rear_z = 13+panel_thick;

hinge_x = 10;
hinge_y = front_y/3-0.3;
hinge_hole = 1.1+0.4;
hook_x = 10;
hook_y = front_y/3-0.3;

board_thick = 1.5;
board_hole_x = 88.6;
board_hole_y = 66.15;

lcd_w = 28.03;
lcd_h = 35.04;
lcd_hole_x = 29;
lcd_hole_y = 52;
lcd_slope = 0.755;
lcd_gap = 3.3;




difference(){
    union(){
        //color( "Blue" ){
        cube( [front_x, front_y, panel_thick] );
        wall_x( 0, 0, 0, front_z );
        wall_x( 0, front_y-panel_thick, 0, front_z );
        wall_y( 0, 0, 0, front_z );
        wall_y( front_x-panel_thick, 0, 0, front_z );
        board_base( 0, 0, 0 );
        
        lcd_base( 15, 28, panel_thick );
        
        hook( front_x, 0, 0, front_z );
        hook( front_x, front_y-hook_y, 0, front_z );
        hinge( -10, 0, 0, front_z );
        hinge( -10, front_y-hinge_y, 0, front_z );
        translate( [front_x, hinge_y, 0] )
        cube( [10, front_y-hinge_y*2, 10] );
        translate( [-10, hinge_y, 0] )
        cube( [10, front_y-hinge_y*2, 10] );
        translate( [-10/2, 20, front_z+panel_thick] )
        rotate( [90, 0, 0] )
        cylinder( 1, 2, 2, center=true, $fn=30 );
        
        translate( [63.5, 0, 0] ){
            translate( [-6-1, front_y-15-37.5-1, panel_thick] )
            cube( [6, 4, 12.5] );
        }
        translate( [front_x, 0, 0] ){
            translate( [-7.5, 0+(12.7-8)/2+7.5, panel_thick] )
            cube( [7.5, 5.2, 10] );
            translate( [-7.5, 12.7+(12.7-8)/2+7.5, panel_thick] )
            cube( [7.5, 5.2, 10] );
            translate( [-7.5, 12.7*2+(12.7-8)/2+7.5, panel_thick] )
            cube( [7.5, 5.2, 10] );
            translate( [-7.5, 12.7*3+(12.7-8)/2+7.5, panel_thick] )
            cube( [7.5, 5.2, 10] );
            translate( [-7.5, 12.7*4+(12.7-8)/2+7.5, panel_thick] )
            cube( [7.5, 5.2, 10] );
        }
        //}
    }
    board_hole( (front_x-board_hole_x)/2, (front_y-board_hole_y)/2, front_z+panel_thick-board_thick);

    lcd_window( 15, 28 );
    lcd_hole( 15, 28, panel_thick );

    translate( [front_x+10, hinge_y-gap1, -10] )
    rotate( [0, -45, 0] )
    cube( [10*sqrt(2), front_y-hinge_y*2+gap2, 10*sqrt(2)] );
    translate( [-10, hinge_y-gap1, -10] )
    rotate( [0, -45, 0] )
    cube( [10*sqrt(2), front_y-hinge_y*2+gap2, 10*sqrt(2)] );
    
    translate( [-10/2-gap1, 20, front_z+panel_thick] )
    rotate( [90, 0, 0] )
    cylinder( 1+gap2, 1, 1, center=true, $fn=30 );
    
    translate( [63.5, 0, 0] ){
        translate( [-1.25, front_y-panel_thick/2+gap1, 13.5] )
        cube( [7.5, panel_thick+gap2*2, 5], center=true );
        translate( [20, front_y-10.5, panel_thick/2] ){
            cube( [10+0.4, 6, panel_thick+gap2*2], center=true );
            translate( [0, 6/2, 0] )
            rotate( [-45, 0, 0] )
            cube( [10+0.4, 6, panel_thick+gap2*2], center=true );
            translate( [0, -6/2, 0] )
            rotate( [45, 0, 0] )
            cube( [10+0.4, 6, panel_thick+gap2*2], center=true );
        }
        translate( [-6, front_y-15-37.5, 0.5] )
        cube( [4, 2, 15] );
    }
    
    translate( [front_x, 12.8, 0] ){
        translate( [-7.5, 0+(12.7-8)/2, -gap1] ){
            cube( [7.5, 7.5, panel_thick*2+gap2] );
            difference(){
            translate( [7.5/2+1.1, 7.5/2, 0] )
            scale( [(7.5+6)/sqrt(2), (7.5+2.95)/sqrt(2), (7.5+2.5)/sqrt(2)] )
            rotate( [0, 0, 45] )
            cylinder( 1, 1, 0, $fn=4 );
            translate( [7.5/2, 0, panel_thick] )
            cube( [7.5, 7.5, 7.5] );
            }
        }
        translate( [-7.5, 12.7+(12.7-8)/2, -gap1] ){
            cube( [7.5, 7.5, panel_thick*2+gap2] );
            difference(){
            translate( [7.5/2+1.1, 7.5/2, 0] )
            scale( [(7.5+6)/sqrt(2), (7.5+2.95)/sqrt(2), (7.5+2.5)/sqrt(2)] )
            rotate( [0, 0, 45] )
            cylinder( 1, 1, 0, $fn=4 );
            translate( [7.5/2, 0, panel_thick] )
            cube( [7.5, 7.5, 7.5] );
            }
        }
        translate( [-7.5, 12.7*2+(12.7-8)/2, -gap1] ){
            cube( [7.5, 7.5, panel_thick*2+gap2] );
            difference(){
            translate( [7.5/2+1.1, 7.5/2, 0] )
            scale( [(7.5+6)/sqrt(2), (7.5+2.95)/sqrt(2), (7.5+2.5)/sqrt(2)] )
            rotate( [0, 0, 45] )
            cylinder( 1, 1, 0, $fn=4 );
            translate( [7.5/2, 0, panel_thick] )
            cube( [7.5, 7.5, 7.5] );
            }
        }
        translate( [-7.5, 12.7*3+(12.7-8)/2, -gap1] ){
            cube( [7.5, 7.5, panel_thick*2+gap2] );
            difference(){
            translate( [7.5/2+1.1, 7.5/2, 0] )
            scale( [(7.5+6)/sqrt(2), (7.5+2.95)/sqrt(2), (7.5+2.5)/sqrt(2)] )
            rotate( [0, 0, 45] )
            cylinder( 1, 1, 0, $fn=4 );
            translate( [7.5/2, 0, panel_thick] )
            cube( [7.5, 7.5, 7.5] );
            }
        }
    }
    
    translate( [-20, 0, 0] )
    #cube( [20, front_y, front_z+20] );
    translate( [0, 15, 0] )
    #cube( [9, front_y-30, front_z+20] );
    //translate( [front_x-2, 15, 0] )
    //#cube( [2, front_y-30, front_z+20] );
    translate( [front_x+4, 0, 0] )
    #cube( [20, front_y, front_z+20] );
    translate( [15, 0, 0] )
    #cube( [front_x-30, 5, front_z+20] );
    translate( [15, 0, 0] )
    #cube( [front_x-75, 13, front_z+20] );
    translate( [15, front_y-2, 0] )
    #cube( [front_x-70, 2.1, front_z+20] );
    translate( [front_x-60, front_y-5, 20] )
    #cube( [30, 5, front_z+20] );
    translate( [front_x-30, front_y-5, 10] )
    #cube( [16, 5, front_z+20] );
    translate( [48, 15, 0] )
    #cube( [7, 55, 5] );
    translate( [55, 30, 0] )
    #cube( [20, 40, 5] );
    translate( [65, 10, 0] )
    #cube( [25, 45, 5] );
}

/*
//translate( [front_x, 22.65, panel_thick] )
//rotate( [-90, 0, 180] )
translate( [0, -20, 0] )
button( 0, 0, 0 );
*/
/*
//translate( [76.5, front_y-15+12.8, panel_thick+2] )
//rotate( [180, 0, 0] )
translate( [0, -20, 0] )
sw( 0, 0, 0 );
*/
/*
//translate( [0, front_y, front_z+rear_z+panel_thick*2] ){
//    rotate( [180, 0, 0] ){
translate( [0, 100, 0] ){
    rotate( [0, 0, 0] ){
        difference(){
            union(){
                //color( "Black" ){
                cube( [front_x, front_y, panel_thick] );
                wall_x( 0, 0, 0, rear_z );
                wall_x( 0, front_y-panel_thick, 0, rear_z );
                wall_y( 0, 0, 0, rear_z );
                wall_y( front_x-panel_thick, 0, 0, rear_z );
                
                hook( front_x, front_y/2-hook_y/2, 0, rear_z );
                hinge( -10, front_y/2-hinge_y/2, 0, rear_z );
                //}
            }
            translate( [30/2, front_y-panel_thick-gap1, panel_thick+3] )
            cube( [front_x-30, panel_thick+gap2, rear_z] );
        }
    }
}

*/



module wall_x( x, y, z, h ){
    translate( [x, y, z+panel_thick] ){
        cube( [front_x, panel_thick, h] );
    }
}

module wall_y( x, y, z, h ){
    translate( [x, y, z+panel_thick] ){
        cube( [panel_thick, front_y, h] );
    }
}

module board_base( x, y, z=0 ){
    base_x = 9;
    base_y = 7;
    translate( [x, y, z] ){
        difference(){
            union(){
            translate( [panel_thick, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [panel_thick, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [front_x-panel_thick-9, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [front_x-panel_thick-9, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            }
            translate( [panel_thick-5, panel_thick-gap1, panel_thick+3] )
            rotate( [0, 45, 0] )
            cube( [base_x+3.5, base_y+gap2, front_z-board_thick] );
            translate( [panel_thick-5, front_y-panel_thick-base_y-gap1, panel_thick+3] )
            rotate( [0, 45, 0] )
            cube( [base_x+3.5, base_y+gap2, front_z-board_thick] );
            translate( [front_x-panel_thick-9+5, panel_thick-gap1, panel_thick-5.7] )
            rotate( [0, -45, 0] )
            cube( [base_x+3.5, base_y+gap2, front_z-board_thick] );
            translate( [front_x-panel_thick-9+5, front_y-panel_thick-base_y-gap1, panel_thick-5.7] )
            rotate( [0, -45, 0] )
            cube( [base_x+3.5, base_y+gap2, front_z-board_thick] );        }
    }
}
module board_hole( x, y, z=0 ){
    hole_height = 10;
    translate( [x, y, z-hole_height+gap1] ){
        translate( [0, 0, 0] )
        cylinder( hole_height, 1.2, 1.5, $fn=8 );
        translate( [board_hole_x, 0, 0] )
        cylinder( hole_height, 1.2, 1.5, $fn=8 );
        translate( [0, board_hole_y, 0] )
        cylinder( hole_height, 1.2, 1.5, $fn=8 );
        translate( [board_hole_x, board_hole_y, 0] )
        cylinder( hole_height, 1.2, 1.5, $fn=8 );
    }
}

module hinge( x, y, z, h ){
    translate( [x, y, z] ){
        difference(){
            union(){
                cube( [hinge_x, hinge_y, h+panel_thick] );
                translate( [hinge_x/2, hinge_y/2, h+panel_thick] )
                rotate( [90, 0, 0] )
                cylinder( hinge_y, hinge_x/2, hinge_x/2, center=true, $fn=30 );
            }
        translate( [hinge_x/2-gap1, hinge_y/2, h+panel_thick] )
        rotate( [90, 0, 0] )
        cylinder( hinge_y+gap2, hinge_hole, hinge_hole, center=true, $fn=30 );
        translate( [0, -gap1, -hinge_x] )
        rotate( [0, -45, 0] )
        cube( [hinge_x*sqrt(2), hinge_y+gap2, hinge_x*sqrt(2)] );
        }
    }
}

module hook( x, y, z, h ){
    translate( [x, y, z] ){
        difference(){
            union(){
                cube( [hook_x, hook_y, h+panel_thick] );
                translate( [0, 0, h+panel_thick] )
                cube( [hook_x, hook_y, hook_x/2] );
             }
        translate( [0, -gap1, 0] )
        rotate( [0, 45, 0] )
        cube( [hook_x*sqrt(2), hook_y+gap2, hook_x*sqrt(2)] );
        }
    }
}

module handle( x, y, z, h ){
    translate( [x, y-5, z] ){
        difference(){
            minkowski(){
                cube( [front_x-20, 25, rear_z+panel_thick-1] );
                translate( [10, 0, 0] )
                cylinder( r=10, h=1 );
            }
            translate( [10/2, 10/2, -gap1] )
            minkowski(){
                cube( [front_x-20-10, 25-10, rear_z+panel_thick-1+gap2] );
                translate( [10, 0, 0] )
                cylinder( r=10, h=1 );
            }
            translate( [-5, -10, -gap1] )
            cube( [front_x+10, 15, rear_z+panel_thick+gap2] );
        }
    }
}


module lcd_window( x, y, z=0 ){
    translate( [x, y, z-gap1] )
    cube( [lcd_w, lcd_h, panel_thick+gap1] );
    translate( [x+lcd_w/2, y+lcd_h/2, z-gap1] )
    scale( [lcd_w*lcd_slope, lcd_h*lcd_slope, lcd_h*lcd_slope] )
    rotate( [0, 0, 45] )
    cylinder( 1, 1, 0, $fn=4 );
}
module lcd_base( x, y, z ){
    translate( [x-0.5, y-12+3/2, z] ){
        translate( [0, 0, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
        translate( [lcd_hole_x, 0, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
        translate( [0, lcd_hole_y, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
        translate( [lcd_hole_x, lcd_hole_y, lcd_gap/2] )
        cylinder( lcd_gap, 3, 3, center=true, $fn=10 );
    }
}
module lcd_hole( x, y, z ){
    translate( [x-0.5, y-12+3/2, z-1.2+gap1] ){
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
        translate( [lcd_hole_x, 0, 0] )
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
        translate( [0, lcd_hole_y, 0] )
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
        translate( [lcd_hole_x, lcd_hole_y, 0] )
        cylinder( 6-1.5, 1.5, 1.8, $fn=8 );
    }
}



module sw( x, y, z=0 ){
    translate( [x, y, z] ){
        difference(){
            //color( "Black" )
            union(){
                cube( [14, 14, 9.5] );
                translate( [14/2-10/2, 14/2-4/2, 9.5] )
                cube( [10, 4, panel_thick+4] );
            }
            translate( [14/2-3.8/2, 14/2-2.5/2, 0-gap1] )
            cube( [3.8, 2.5, 2.5] );
        }
    }
}



module button( x, y, z=0 ){
    translate( [x, y, z] ){
        //color( "Black" )
        union(){
            cube( [7.5*0.97, panel_thick, 7.5*0.97] );
            translate( [panel_thick, -22, 0] )
            cube( [8.5*0.97, 22, 7.5*0.97] );
        }
    }
}