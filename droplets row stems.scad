// Code by Katrien van Riet - May 2024
// These sequins are useful for use in weaving on a loom

// Matrix variables
x_number = 22;
y_number = 5;
connector_width = 1;
connector_length = 2;
spacing = 10;

// Single sequin variables
thickness = 0.28;
diam_large = 8;
diam_small = 3.5;
diam_point = 2;
length = 12;


module unit(){
    for (x = [0:x_number-1]){
        translate([x*spacing,0,0])
            sequin();
    }
    translate([-connector_width/2,diam_small/2+connector_width,0])
        cube([spacing*(x_number-1)+connector_width, connector_width, thickness]);
}


for (y = [0:y_number-1]){
    translate([0,y*(length*1.8),0]){
        unit();
    }
}

module sequin(){
    hull(){
        cylinder(h = thickness, d = diam_small, $fn = 20);
        translate([0,-length/2,0])
            cylinder(h = thickness, d = diam_large, $fn = 40);
        translate([0,-length-diam_small/2,0])
        cylinder(h = thickness, d = diam_point, $fn = 10);
    }
    translate([0,diam_small/2+connector_width/2,thickness/2])
        cube([connector_width,connector_width,thickness], center=true);
    translate([0,diam_small/2,thickness/2])
        cube([connector_width,connector_width,thickness], center=true);
}

//sequin();
//unit();