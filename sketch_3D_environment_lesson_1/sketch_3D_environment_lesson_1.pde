import java.awt.Robot;
//color pallette
color black = #000000;
color white = #FFFFFF;
color red = #f44336;

//Map variables
int gridSize;
PImage map;

//textures
PImage mossyStone;
PImage oakPlanks;
//Robot for mouse control
Robot rbt;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX  = width/2;
  focusY = height/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  leftRightHeadAngle = radians(270);

  try { //if else
    rbt = new Robot();
  }
  catch(Exception e) { //instead of program crashing
    e.printStackTrace();
  }
  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
}


void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
  drawMap();
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  fill(255, 0, 0);
  sphere(5);
  popMatrix();
}

void drawMap() {
  for (int x = 0; x < map.width; x ++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c != black) {
        pushMatrix();
        fill(c);
        stroke(100);
        translate(x*gridSize-2000, height/2, y*gridSize-2000);
        box(gridSize, height, gridSize);
        popMatrix();
      }
    }
  }
}



void drawFloor() {
  stroke(255);
  for (int x = -2000; x <= 2000; x = x + 100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
    line(x, 0, -2000, x, 0, 2000);
    line(-2000, 0, x, 2000, 0, x);
  }
}


void controlCamera() {
  if (wkey) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }
  leftRightHeadAngle = leftRightHeadAngle + (mouseX-pmouseX)*0.01;
  upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*-0.01;

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;
  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  if (mouseX > width-2) rbt.mouseMove(3, mouseY); //teleport it to lefthand side
  else if (mouseX < 2) rbt.mouseMove(width-3, mouseY);
}


void keyPressed() {
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'S' || key == 's') skey = true;
  if (key == 'D' || key == 'd') dkey = true;
}


void keyReleased() {
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'S' || key == 's') skey = false;
  if (key == 'D' || key == 'd') dkey = false;
}
