module zCarriageBase(){
    
    cube([59,24+4,5]);
    cube([15+4,24+4,10]);
    translate([59-15-4,0])cube([15+4,24+4,10]);
    translate([59/2-17/2,0])cube([13+4,6.5+4,15+5]);
    translate([59/2-13/2,6.5+4])cube([13,17.5,8]);
    hull(){
    translate([-5,28/2])cylinder(r=5,h=5,$fn=50);
    translate([59+5,28/2])cylinder(r=5,h=5,$fn=50);
    }
    
    
    
}
module bindCut(){
    diameter = 15+3;
    rotate([-90,0])difference(){
    cylinder(r=diameter/2+3,h=3,$fn=50);
    cylinder(r=diameter/2,h=3,$fn=50);  
}
}
module zCarriageHoles(){
//cut m8 nut
    translate([59/2-13/2,2,5])cube([13,6.5,20]);
//threaded rod 8mm
translate([59/2,0,15/2+5])rotate([-90,0])cylinder(r=9/2,h=50,$fn=30);
    
//lm8uu holes
    translate([15/2+2,2,15/2+5])rotate([-90,0,0])cylinder(r=15/2,h=24,$fn=50);
    translate([59-2-15/2,2,15/2+5])rotate([-90,0,0])cylinder(r=15/2,h=24,$fn=50);
//rod cut
    translate([15/2+2,0,15/2+5])rotate([-90,0,0])cylinder(r=10/2,h=30,$fn=50);
    translate([59-2-15/2,0,15/2+5])rotate([-90,0,0])cylinder(r=10/2,h=30,$fn=50);  
//lm8uu binders
    
    translate([15/2+2,12,15/2+4])bindCut();
    translate([15/2+2,20,15/2+4])bindCut();
    
    translate([59-2-15/2,12,15/2+4])bindCut();
    translate([59-2-15/2,20,15/2+4])bindCut();
    //mount holes
    translate([59/2,28/2+1])cylinder(r=4.2/2,h=30,$fn=30);
    translate([59/2,28/2+9])cylinder(r=4.2/2,h=30,$fn=30);
    translate([-5,28/2])cylinder(r=4.2/2,h=30,$fn=30);
    translate([59+5,28/2])cylinder(r=4.2/2,h=30,$fn=30);
    //m4 nut holes
    translate([59/2,28/2+1,4])cylinder(r=8.2/2,h=50,$fn=6);
    translate([59/2,28/2+9,4])cylinder(r=8.2/2,h=50,$fn=6);
    //mount helper
    translate([0,5])cube([59,3,2]);
}

difference(){
    zCarriageBase();
    zCarriageHoles();
}