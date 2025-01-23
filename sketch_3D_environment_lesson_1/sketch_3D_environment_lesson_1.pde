import java.awt.Robot;
//color pallette
color black = #000000; //empty
color white = #FFFFFF;
color red = #f44336; //mossy
color teal = #009688; //oak

//Map variables
int gridSize;
PImage map;

//textures
PImage mossyStone;
PImage oakPlanks;
//Robot for mouse control
Robot rbt;
boolean skipFrame;

//GameObjects
ArrayList<GameObject> objects;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  fullScreen(P3D);
  objects = new ArrayList <GameObject>();
  mossyStone = loadImage("mossy.jpg");
  oakPlanks = loadImage("oak.jpg");
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = 9*height/10; //y variable
  eyeZ = 0;
  focusX  = width/2;
  focusY = height/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  leftRightHeadAngle = radians(270);
  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
  noCursor();

  try { //if else
    rbt = new Robot();
  }
  catch(Exception e) { //instead of program crashing
    e.printStackTrace();
  }
  skipFrame = false;
}


void draw() {
  background(0);
 // pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  drawFloor(-2000, 2000, height, 100); //floor
  drawFloor(-2000, 2000, height-gridSize*4, 100); //ceiling
  drawFocalPoint();
  controlCamera();
  drawMap();
  
  int i = 0;
  while( i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if(obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  fill(red);
  sphere(5);
  popMatrix();
}




void controlCamera() {
  if (wkey && canMoveForward()) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey && canMoveBackward()) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey && canMoveRight()) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;
  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
  // println(eyeX, eyeY, eyeZ);
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
