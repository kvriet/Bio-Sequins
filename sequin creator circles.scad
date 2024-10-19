// All values in mm
// Code by Katrien van Riet - April 2024

$fn = 20;

x_number = 5;
y_number = 5;
z = 0.28;
hole = 2;
diam = 10;
connector_width = 1;
connector_length = 2;

// cube([x, y, z], center = true);


module unit(){
    difference(){
        cylinder(h = z, d = diam, center = true);
        translate([0,diam/2-2,0])        
        cylinder(h = z*2, d = hole, center = true);
    }

    translate([0,-(diam+connector_length)/2,0])
    cube([connector_width, connector_length+1, z], center=true);
    translate([(diam+connector_length)/2,0,0])
    cube([connector_length+1, connector_width, z], center=true);
}


for (y = [0:y_number-1]){
    translate([0,y*(diam+connector_length),0]){
        for (x = [0:x_number-1]){
            translate([x*(diam+connector_length),0,0])
            unit();
        }
    }
}

//unit();