// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <bearing.scad>
rod_distance = 50;
zoffset=3;
module x_end_base(){
// Main block
height = 68;
translate(v=[-15,-9,height/2]) cube(size = [22,39,height], center = true);
translate([-11-4,-41+25-5,2]) cube([50,50,4], center = true);
translate([-4,-10,4])rotate([90,0,0])linear_extrude(height=15)polygon(points=[[0,0], [12,0], [0,12]]);
translate([-22-4,-10,4])rotate([90,0,0])linear_extrude(height=15)polygon(points=[[0,0], [-12,0], [0,12]]);
}

module x_end_holes(){
// vertical_bearing_holes();
//mount holes
translate([-(11+4+32/2),-41])cylinder(r=5.2/2,h=20,$fn=30);   
translate([-(11+4)+32/2,-41])cylinder(r=5.2/2,h=20,$fn=30);    
translate([-(11+4)+32/2,-41+39])cylinder(r=5.2/2,h=20,$fn=30);
translate([-(11+4+32/2),-41+39])cylinder(r=5.2/2,h=20,$fn=30);
translate([-4-11-12/2,-41-5])cube([12,17.5,4]);   
 
// Belt hole
 
translate(v=[-1,0,zoffset]){
difference(){
	translate(v=[-5.5-10+1.5,-10,30]) cube(size = [10,46,28], center = true);
	// Nice edges
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);

}
}

// Bottom pushfit rod
translate(v=[-15,-41.5,6+zoffset]) rotate(a=[-90,0,0]) pushfit_rod(12.1,50);
// Top pushfit rod
translate(v=[-15,-41.5,rod_distance+6+ zoffset]) rotate(a=[-90,0,0]) pushfit_rod(12.1,50);

}


// Final prototype
module x_end_plain(){
 difference(){
  x_end_base();
  x_end_holes();
 }
}

x_end_plain();


module pushfit_rod(diameter,length){
 cylinder(h = length, r=diameter/2, $fn=30);
 difference(){
 	translate(v=[0,-diameter/2.85,length/2]) rotate([0,0,45]) cube(size = [diameter/2,diameter/2,length], center = true);
 	translate(v=[0,-diameter/4-diameter/2-0.4,length/2]) rotate([0,0,0]) cube(size = [diameter,diameter/2,length], center = true);
 }

}

