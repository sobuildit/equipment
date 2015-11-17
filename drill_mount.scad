//
// Drill press adapter for micro air grinder for use in 
// SMI drill press
// D. Rowntree 17Nov15
//

// Configure
od=43;
id=15.4;
clearance=1;
slot_w=5;
height=29;
fn=200;

// render top level
body();

module body()
{
    difference(){
        bulk();
        bulk_remove();
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
        