poly_n = 40;
$fn=100;
// cylinder(40,60,80,$fn=150);
// cylinder(40,60,80,$fn=150);
// # cylinder(h=40,70,80);

difference(){
    cylinder(80,35,45, center=true);
    cylinder(82,30,30,center=true);
 }

difference(){
    translate([0,0,35]) {
        cylinder(10,60,60, center=true);
    }
    cylinder(82,30,30,center=true);
}
