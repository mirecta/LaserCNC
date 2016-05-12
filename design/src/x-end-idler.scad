// PRUSA iteration3
// x end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

module x_end_idler_base(){
 difference(){
 x_end_base();
     x_end_holes();
 }
 translate(v=[-10,-21.4,33.25])rotate(a=[0,-90,0])cylinder(h=1,r2=2.25,r1=5);
 translate(v=[-19,-21.4,33.25])rotate(a=[0,-90,0])cylinder(h=1,r1=2.25,r2=5);
}

module x_end_idler_holes(){

 
    translate([0,2,3]){
 translate(v=[0,-23.4,30.25]) rotate(a=[0,-90,0]) cylinder(h = 40, r=2.25, $fn=30);
 translate(v=[-23,-23.4,30.25])rotate(a=[0,-90,0])cylinder(h =3, r=7.66/2, $fn=6);	
}
}
 
// Final part
module x_end_idler(){
 mirror([0,1,0]) difference(){
  x_end_idler_base();
  x_end_idler_holes();
 }
}

x_end_idler();


