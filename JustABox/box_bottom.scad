
sizex  = 80;
sizey  = 70;
sizeh  = 30;
wall   = 3;
dewall = 5;
base   = 2;

lidh   = 10;
tolerance = 0.3;

difference() {
  union(){
    cube([sizex,sizey,sizeh], center = true);
    translate([0,0,-base]) {
      cube([sizex+wall,sizey+wall,sizeh-dewall], center = true);
    }
  }
  translate([0,0,base]) {cube([sizex-wall,sizey-wall,sizeh-wall], center = true);}
}