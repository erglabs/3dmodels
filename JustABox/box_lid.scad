
sizex  = 60;
sizey  = 40;
sizeh  = 30;
wall   = 2;
dewall = 5;
base   = 2;

lidh   = 6;
tolerance = 0.7;

rotate([180,0,0]) {
  translate([0,0,0]) {
    difference() {
      translate([0,0,0]) {
          cube([sizex+wall,sizey+wall,lidh], center = true);
      }
      translate([0,0,-base]) {cube([sizex+tolerance,sizey+tolerance,lidh], center = true);}
  //    translate([0,0,base]) {cube([sizex-wall,sizey-wall,sizeh-wall], center = true);}
    }
  }
}