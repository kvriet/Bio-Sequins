// Code by Katrien van Riet - June 2024

$vpf = 30;
$vpr = [0, 0, 0];

/* [Buildplate:] */
show_buildplate = true;
buildplate_dimensions = [235,235];

/* [Number:] */
units_per_row = 10;     // [0:20]
rows = 5;               // [0:15]

/* [Sequin parameters:] */
sequin_thickness = 0.28;    // [0:0.01:1]
hole_diameter = 1.5;        // [0:0.1:3]
sequin_diameter_large = 10; // [0:1:20]
sequin_diameter_small = 4;  // [0:1:20]
sequin_diameter_point = 1;  // [0:1:10]
sequin_length = 15;         // [0:1:30]
row_offset = 10;            // [0:1:30]

/* [Row parameters:] */
connector_width = 1;        // [0:0.1:2]
connector_length = 2;       // [0:0.1:5]

if (show_buildplate && $preview){
    color("silver")
    translate([-20,-30,-2])
    cube([buildplate_dimensions[0],buildplate_dimensions[1], 1]);
}

module row(){
    for (x = [0:units_per_row]){
        translate([x*(sequin_diameter_large+connector_length),0,0])
            unit();
    }
}

for (y = [0:rows]){
    translate([0,y*(sequin_length+row_offset),0]){
        color("black")
        row();
    }
}

module sequin(){
    hull(){
        cylinder(h = sequin_thickness, d = sequin_diameter_small, $fn = 20);
        translate([0,-sequin_length/2,0])
            cylinder(h = sequin_thickness, d = sequin_diameter_large, $fn = 40);
        translate([0,-sequin_length-sequin_diameter_small/2,0])
        cylinder(h = sequin_thickness, d = sequin_diameter_point, $fn = 10);
    }
}

module unit(){
    difference(){
        sequin();
        translate([0,0,-sequin_thickness/4])
        cylinder(h = sequin_thickness*2, d = hole_diameter, $fn = 20);
    }
    
    translate([(sequin_diameter_large+connector_length)/2, -sequin_length/2, sequin_thickness/2])
        cube([connector_length+1, connector_width, sequin_thickness], center=true);  
}

//unit();