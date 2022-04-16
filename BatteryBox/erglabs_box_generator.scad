
// desired ammount of cells -1
cells_x=4-1;
cells_y=5-1;

// model is made by difference in two  cubes, which means 
// the outer box (actuall physical boundary)
// should be a bit bigger than the empty box below
// difference will result in thicker/thiner walls
//
// this is desired size of the empty box (should depends on
// the type of battery you want. Please mind that no printer is 
// perfect, i.e. printer that makes 0.2mm lines will not always to 
// make walls in dimensions.
// think about it like adding 0.2-0.5mm tolerance to print.
// below are tested designs for european ni-mh batteries
// for AAA = [ h=34, d=10.9 ]
box_h=34;
box_d=10.9;

// desired (general) wall size
wall=1;

// wall used to make a lid holder
extwall=1;

// size difference used for lid to take hold on the box
// bigger difference means more plastic for a lid, but also more grip
dewall=3;

// used for calculations do not worry about those :)
// weird calculations start:
bigd=box_d+wall+wall;
bigh=box_h;
// small-d :D
smalld=box_d;
smallh=box_h;
dist=wall+smalld;

barx=(cells_x*smalld)+(cells_x*wall)+smalld+wall+wall;
bary=((cells_y+1)*smalld)+((cells_y+1)*wall)++wall;
walloff=wall/2;
xmid=(((cells_x-1)*wall)+((cells_x-1)*smalld))-(smalld/2)-(wall/2);
echo(xmid);
ymid=(((cells_y-1)*wall)+((cells_y-1)*smalld))-smalld-wall;
echo(ymid);

wallhalf=wall/2;
extwallhalf=extwall/2;
// weird calculations stop

// # make rims
// xwalls
translate([xmid,ymid+(bary/2)+extwallhalf,-((wall*dewall)/2)]){
  cube([barx+2*extwall,extwall,smallh-(wall*dewall)],center=true);
}
translate([xmid,ymid-(bary/2)-extwallhalf,-((wall*dewall)/2)]){
  cube([barx+2*extwall,extwall,smallh-(wall*dewall)],center=true);
}

// ywalls
translate([xmid+(barx/2)+extwallhalf,ymid,-((wall*dewall)/2)]){
  cube([extwall,bary+2*extwall,smallh-(wall*dewall)],center=true);
}
translate([xmid-(barx/2)-extwallhalf,ymid,-((wall*dewall)/2)]){
  cube([extwall,bary+2*extwall,smallh-(wall*dewall)],center=true);
}



//draw rim
//difference() {
  // for cells in y row
  for (t_y= [0:cells_y]) {
    // for cells in x row
    for (t_x= [0:cells_x]) {
      difference(){
        // big box:
        translate([dist*t_x,dist*t_y,0]) {
          cube([bigd,bigd,bigh], center=true);
        }
        // small box
        translate([dist*t_x,dist*t_y,0]) {
          translate([0,0,wall]) {
            cube([smalld,smalld,smallh], center=true);
          };
        }
      } // diff
    } // for x
  } // for y