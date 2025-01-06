float rotx, roty;

void setup() {
  size(800, 800, P3D); //turns sketch into 3D using rendering engine
}

void draw() {
  background(255);
  translate(width/2, height/2, 0); // 0 is z coordinate
  rotateX(rotx); //will rotate push and pop matrix around x-axis
  rotateY(roty); //rotate around y-axis;
 //rotateZ();
 fill(255, 0, 0);
 stroke(0);
 strokeWeight(3);
  box(200, 200, 200);  //similar to rect - rectangular prism - Width, Height, Depth
  
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01; //pmouse = previous mouse coordinate
  roty = roty + (pmouseX - mouseX) *-0.01;
  
}
