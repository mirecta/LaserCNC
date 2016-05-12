thick= 23;
module carriageBase()
{
hull(){
    cube([66,25,thick]);
translate([66/2-34/2,50+12.5-21/2-2-1])cube([34,1,thick]);
}
translate([66/2-34/2,50+12.5-21/2-2])cube([34,21+4,thick]);
hull(){
cube([66,1,5]);
translate([66/2-35/2,-15])cube([35,1,5]);
}
}
module bindCut(){
    diameter = 21+5;
    rotate([0,90])difference(){
    cylinder(r=diameter/2+4,h=5,$fn=50);
    cylinder(r=diameter/2,h=5,$fn=50);  
}
}
module carriageHoles(){
    translate([0,0,10])cube([66,25,50]);
    translate([0,50,10])cube([66,25,50]);
    //lm holes
   translate([2,10.5+2,10.5+5])rotate([0,90,0]) cylinder(r=10.5, h=30.0,$fn=50);
    translate([2+30+2,10.5+2,10.5+5])rotate([0,90,0]) cylinder(r=10.5, h=30.2,$fn=50);
    translate([66/2-15,10.5+2+50,10.5+5])rotate([0,90,0]) cylinder(r=10.5, h=30.2,$fn=50);
    
    translate([15+2-2.5+10,10.5+2,10.5+5])bindCut();
    translate([15+2-2.5-10,10.5+2,10.5+5])bindCut();
    translate([15+2-2.5+10+32,10.5+2,10.5+5])bindCut();
    translate([15+2-2.5-10+32,10.5+2,10.5+5])bindCut();
    translate([15+2-2.5-10+32+3,10.5+2+50,10.5+5])bindCut();
    translate([15+2-2.5+10-3,10.5+2+50,10.5+5])bindCut();
    translate([0,25,5])cube ([66,4.5,20]);
    
    //mount holes
    translate([66/2+15,-7.5])cylinder(r=4.2/2,h=50,$fn=30);
    translate([66/2-15,-7.5])cylinder(r=4.2/2,h=50,$fn=30);
    translate([66/2+15,39])cylinder(r=4.2/2,h=50,$fn=30);
    translate([66/2-15,39])cylinder(r=4.2/2,h=50,$fn=30);
    //nuts m4
    translate([66/2+15,39,5])cylinder(r=8.2/2,h=50,$fn=6);
    translate([66/2-15,39,5])cylinder(r=8.2/2,h=50,$fn=6);
    translate([0,2+10.5,5+10.5])rotate([0,90,0])cylinder(r=16/2,h=66,$fn=50);
     translate([0,2+10.5+50,5+10.5])rotate([0,90,0])cylinder(r=16/2,h=66,$fn=50);
    
}

module carriageBelt(){
  
  position_tweak=-1.5;
  belt_offset = 0;
  belt_tooth_distance = 2;
  belt_tooth_ratio = 0.5;
    
    
    
  translate([0,20+10.5+2+belt_offset,13])cube ([66,0.9,20]); 
  
      for ( i = [0 : 33] ){
	translate([i*belt_tooth_distance+position_tweak,20+10.5+2+belt_offset+0.9,13]) cube([belt_tooth_ratio*belt_tooth_distance,1.7,30]);
   }
   translate([0,20+10.5+2+belt_offset+12-1,5])cube ([66,8,20]);
   translate([66/2-7.5/2,20+10.5+2+belt_offset,5])cube([7.5,15,20]);
   
   translate([0,20+10.5+2+belt_offset+0.9,22])rotate([45,0,0])cube([66,20,20]);
}


difference(){
   carriageBase();
   carriageHoles();
   carriageBelt();
} 
    