float rotx, roty;

void setup() {
  size(800, 800, P3D); //turns sketch into 3D using rendering engine
}

void draw() {
  background(255);
 //cube(width/2, height/2, 0, #FF0000, 200 );
 cube(500, 200, 0, #a8e61d, 200);
 cube(600, 400, 0, #fff200, 200);
 cube(100, 500, 0, #7c4dff, 200);
 ball( 200, 200, 0, #000000, #F89000, 300);
 ball(width/2, height/2, 0, #F80000, #000000, 200);
}

void ball(float x, float y, float z, color c, color s, float size) {
  translate(x, y, z); // 0 is z coordinate
  rotateX(rotx); //will rotate push and pop matrix around x-axis
  rotateY(roty);
 fill(c);
 stroke(s);
 strokeWeight(3);
 sphere(size);
}
void cube(float x, float y, float z, color c,float size) {
  pushMatrix();
   translate(x, y, z); // 0 is z coordinate
  rotateX(rotx); //will rotate push and pop matrix around x-axis
  rotateY(roty); //rotate around y-axis;
 //rotateZ();
 fill(c);
 stroke(0);
 strokeWeight(3);
  box(size);  //similar to rect - rectangular prism - Width, Height, Depth
  popMatrix();
  
}
void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01; //pmouse = previous mouse coordinate
  roty = roty + (pmouseX - mouseX) *-0.01;
}
