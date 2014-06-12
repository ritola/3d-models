r1 = 8.5;
r2 = 15;
height = 17;
distance = 16;
wall = 3;

angle1 = 20;
angle2 = 30;

total_x = r2 * 2 + distance;
total_y = r2 * 2;
innerscale_x = total_x / (total_x + wall * 2);
innerscale_y = total_y / (total_y + wall * 2);

linear_extrude(height) 
  difference() {
    flat_shape();
    translate([0.4, 0, 0])
      scale([innerscale_x, innerscale_y, 1]) 
        flat_shape();
  }

module flat_shape() {
  union() {
    translate([distance, 0, 0])
      circle(r1);
    circle(r2);
    trapezoid(
      r1 * sin(angle1) + distance, 
      r1 * cos(angle1), 
      r2 * sin(angle2), 
      r2 * cos(angle2));
  }
} 

module trapezoid(x1, y1, x2, y2) {
  polygon([
      [x1,   y1], 
      [x1, - y1], 
      [x2,   y2], 
      [x2, - y2]
    ], [[1,0,2,3]]);
}
