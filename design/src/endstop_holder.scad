
rod=8;
thick=3;
height=8;

module base(){
        
    cylinder(r=rod/2+thick,h=height,$fn=50);
    translate([-(rod+2*thick)/2,0])cube([rod+2*thick,rod/2+2+4,height]);
    translate([(rod+2*thick)/2,rod/2+2-4])cube([3,8,height]);
    translate([-(rod+2*thick)/2,-(rod/2+thick+4)])cube([rod+2*thick,6,height]);
}


module holes(){
    cylinder(r=rod/2,h=height,$fn=50);
    translate([-(rod-1)/2,0])cube([rod-1,rod+8,height]);
    //nut and screw hole
    translate([(rod+2*thick)/2,rod/2+2,height/2])#rotate([0,90])cylinder(r=6.1/2,h=3,$fn=6);
    translate([-rod,rod/2+2 ,height/2])rotate([0,90])cylinder(r=3.2/2,h=2*rod,$fn=30);
    translate([-9/2,-(rod/2+thick+3)])cube([9,3,height]);
}

difference(){
    base();
    holes();
}
