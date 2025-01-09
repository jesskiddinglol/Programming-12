float rotx, roty;
PImage dirt;
PImage grass;
PImage grassSide;
void setup() {
  size(800, 800, P3D);
  grass = loadImage("grass.png");
  grassSide = loadImage("grassSide.png");
  dirt = loadImage("dirt.png");
  textureMode(NORMAL);
}

void draw() {
  background(0);
  dirt(width/2, height/2, 0);
}

void dirt(float x, float y, float z) {

  pushMatrix();
  translate(x, y, z);
  scale(200);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS); //groups of 4 vertexes
  texture(grass);
  //top
  //---- x, y, z, texture x, texture y
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();
  //bottom
  beginShape(QUADS); //groups of 4 vertexes
  texture(dirt);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();
  //front
  beginShape(QUADS);
  texture(grassSide);
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //left
  vertex(0, 0, 1, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //right
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);
  endShape();


  popMatrix();
}



void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
