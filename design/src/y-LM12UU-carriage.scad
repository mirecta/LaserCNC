    height = 49;
    width = 66;
    thick=4;

module carriageBase(){
    

    translate([0,-height/2,0])cube([width,height,thick]);
    translate([(width - 66)/2, -25/2,0])cube([66,25,21/2+thick+2]);
    
}

module bindCut(distance = 0){
    diameter = 21*2;
    translate([distance,0,diameter/2+thick-1])rotate([0,90])difference(){
    cylinder(r=diameter/2+thick,h=5,$fn=50);
    cylinder(r=diameter/2,h=5,$fn=50);  
}
}

module carriageHoles(){
  //rod cut
  translate([0,-21/2,(thick+21/2+2)-12.5/2])cube([width,21,20]);
  //lm12uu cuts
  
  translate([(width - 66)/2+2,0,21/2+thick+2])rotate([0,90])cylinder(r=21/2,h=30,$fn=50);
  translate([(width - 66)/2+ 30 +4,0,21/2+thick+2])rotate([0,90])cylinder(r=21/2,h=30,$fn=50);  
  //bind cuts
    bind_base = (width - 66)/2+2;
  bindCut(bind_base + 3);
  bindCut(bind_base + 30-3-5);  
  bindCut(bind_base + 30 + 3 + 2); 
  bindCut(bind_base + 60 -3 -5 + 2);  
  //mount holes
  translate([2+15,49/2-5])cylinder(r=5.2/2,h=20,$fn=30);
  translate([2+15,-(49/2-5)])cylinder(r=5.2/2,h=20,$fn=30); 
  translate([4+30+15,49/2-5])cylinder(r=5.2/2,h=20,$fn=30);
  translate([4+30+15,-(49/2-5)])cylinder(r=5.2/2,h=20,$fn=30); 
    
}

difference(){
carriageBase();
   carriageHoles();
}