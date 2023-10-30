$fn = 64;
$fa = 6;
ri = 10;

union() {
    difference() { // base plate
        cylinder(5, r=ri+20);
        translate([0, 0, -1])cylinder(7, r=ri);
    }
    difference() { // outer ring
        cylinder(40, r=ri+10);
        translate([0, 0, -1]) cylinder(32, r=ri+7);
        translate([0, -10, -1]) cube([2*ri, 20, 100]);
        translate([-5-ri, 50, 3*ri+15]) rotate([90, 0, 0]) cylinder(100, r=3*ri);
        for (a = [-50, 50]) {
            rotate([0, 0, a]) translate([ri+11, 0, 4+5]) cube([20, 6, 6], center=true);
        }
    }
    // Hooks for rubber band
    for (a = [-60, 60]) {
        rotate([0, 0, a]) translate([ri+8.5, 0, 28]) cylinder(10, d=3, center=true);
        rotate([0, 0, a]) translate([ri+8.5, 0, 33]) sphere(d=3);
    }
    // moving chamber
    translate([0, 0, 10])difference(){
        union() {
            cylinder(40, r=ri+4);
            translate([ri, -4, 10])cube([6.5, 8, 20]); // nut sleeve
            // actuator
            translate([ri, 0, 0]) difference() {
                union() {
                    translate([3, 0, 25/2*sqrt(2)]) rotate([0, 45, 0]) cube([25, 10, 25], true);  // bottom
                    translate([7, -13, 39.5])cube([10, 26, 5]); //top
                }
                translate([9, -6, 25*sqrt(2)/2-1.25])cube([6, 12, 2.5]); // nut slot
                translate([12, 0, 4])cylinder(50, d=3.2);   // lead screw hole
            }
        }
        // cutaway
        translate([0, 0, -1])cylinder(42, r=ri);
        translate([-ri*0.8, 0, ri+10+25])cube([3*ri, 2*ri+10, 50], true);
        translate([-ri*0.3, 1.5*ri, ri+10])rotate([90, 0, 0])cylinder(3*ri, r=ri);
        translate([-1.3*ri, 0, 10+50])cube([2*ri, 100, 100], true);
        // top notch
        translate([ri+1.5, 0, 39.5])rotate([90, 0, 0])cylinder(3*ri, d=2.5, center=true);
        // mounting holes
        for (i = [0:2])
            translate([0, 0, 15+i*5.5])rotate([0, 90, 0])cylinder(ri+10, d=3);
        translate([ri+3, -5.5/2, 15-5.5/2])cube([2.5, 5.5, 30]);
    }
    translate([ri, 0, 10]) {
        // flexures
        translate([0, -9, 1])cube([40, 18, 0.6]);
        translate([0, -9, 35])cube([40, 5, 0.6]);
        translate([0, 4, 35])cube([40, 5, 0.6]);
        // housing
        translate([5, 9.9, -10])cube([35, 3, 50]);
        difference() {
            translate([5, -12.9, -10])cube([35, 3, 50]);
            translate([7, -13.9, 12.5])cube([10, 5, 10]);
        }
        translate([35, -10, -10])cube([5, 20, 50]);
        
        
    }
}

// table addon
translate([0, 2*ri+30, 0]) {
    difference() {
        translate([0, 0, 0.7*ri]) rotate([0, 90, 0])cylinder(30, r=0.9*ri);
        translate([-50, -50, -100]) cube([100, 100, 100]);
        translate([1.25*ri, ri, 1.5*ri]) rotate([90, 0, 0]) cylinder(2*ri, r=ri,
 true);
        translate([1.25*ri, -ri, 0.5*ri]) cube([40, 2*ri, 2*ri]);
        hull () {
            translate([26, 0, 0]) cylinder(2*ri, d=3, center=true);
            translate([6, 0, 0]) cylinder(2*ri, d=3, center=true);
        }
        hull() {
            translate([26, 0, 1.5*ri]) cylinder(2*ri, d=6, center=true);
            translate([6, 0, 1.5*ri]) cylinder(2*ri, d=6, center=true);
        }
    }
    
}

// clamp base
translate([0, 4*ri+30, 0]) {
    difference() {
        translate([0, 0, 0.7*ri]) rotate([0, 90, 0])cylinder(40, r=0.9*ri);
        translate([-50, -50, -100]) cube([100, 100, 100]);
        translate([-10, -ri, 0.3*ri]) cube([60, 2*ri, 2*ri]);
        hull () {
            translate([26, 0, 0]) cylinder(2*ri, d=3, center=true);
            translate([6, 0, 0]) cylinder(2*ri, d=3, center=true);
        }
        for (p = [0.5:0.75:10]) {
            translate([40-p, 0, 0.3*ri]) rotate([90, 0, 0]) cylinder(2*ri, d=0.45, center=true);
        }
    }    
}

// clamp movable jaw
translate([0, 6*ri+30, 0]) {
    difference() {
        translate([0, 0, 0.7*ri]) rotate([0, 90, 0])cylinder(40, r=0.9*ri);
        translate([-50, -50, -100]) cube([100, 100, 100]);
        translate([3, -ri, 0.3*ri]) cube([60, 2*ri, 2*ri]);
        translate([-10, -ri, 1.2*ri]) cube([60, 2*ri, 2*ri]);
        hull () {
            translate([26, 0, 0]) cylinder(2*ri, d=3, center=true);
            translate([6, 0, 0]) cylinder(2*ri, d=3, center=true);
        }
        for (p = [0.5:0.75:10]) {
            translate([40-p, 0, 0.3*ri]) rotate([90, 0, 0]) cylinder(2*ri, d=0.45, center=true);
        }
    }    
}
