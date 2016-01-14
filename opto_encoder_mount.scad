//
// Drill press adapter for micro air grinder for use in 
// SMI drill press
// D. Rowntree 17Nov15
//
// Adapted for use as optical rotary encoder mount.
// JSR 14/01/2016


use <MCAD/polyholes.scad>;

// Configure

id=36.15;
od=id + 15.0;

clearance=1.0;
slot_w=5;
height=29;
fn=200;

mount_hole_d = 5.0;
collar_tension_d = 3.0;
collar_tension_nut_d = 5.40;
collar_tension_head_d = 5.70;

// render top level
body();

module body()
{
    difference(){
        bulk();
        bulk_remove();
        mount_holes();
        collar_tension();
    }
}

module bulk()
{
    cylinder(h=height/2, r=od/2, center = true, $fn=fn);
}

module bulk_remove()
{
    union(){
        cylinder(h=4+height/2, r=id/2-clearance, center=true, $fn=fn);
        translate([-od/4,0,0]) cube([2+od/2,slot_w,4+height/2], center=true);
    }
   
}
        
module mount_holes() 
{
    translate([0,(od + id)/4.0 ,-height/4.0 - 1.0]) polyhole(d = mount_hole_d, h = height/2.0 + 2.0);
    translate([0,-(od + id)/4.0 ,-height/4.0 - 1.0]) polyhole(d = mount_hole_d, h = height/2.0 + 2.0);
    translate([(od + id)/4.0, 0,-height/4.0 - 1.0]) polyhole(d = mount_hole_d, h = height/2.0 + 2.0);
}

module collar_tension()
{
    union () {
        rotate([90,0,0]) {
            translate([-(od + id)/4.0, 0, 0]) {
                translate([0, 0, -height/4.0 - 1.0]) polyhole(d = collar_tension_d, h = height/2.0 + 2.0);
                translate([0, 0, -3.0*height/4.0 - 1.0]) polyhole(d = collar_tension_nut_d, h = height/2.0 + 2.0);
                translate([0, 0, height/4.0 - 1.0]) polyhole(d = collar_tension_head_d, h = height/2.0 + 2.0);
            }
        }
    }
}

