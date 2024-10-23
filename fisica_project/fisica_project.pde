import fisica.*;
FWorld world;
FPoly road;
FPoly bump;
color blue = #00b4d8;
color black = #000000;
color grey = #495057;
color purple = #5a189a;
color red = #d00000;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
ArrayList<Road>lines;
float x, y, s, w;
int numLines = 10;
PImage car1;
PImage car2;
float RedcarX;
float RedcarY;
float PurpcarX;
float PurpcarY;
float alpha;
FBox redcar;
FBox purplecar;
FBox traffic;
PImage Red;
PImage Purple;

void setup() {
  size(800, 800);
  createWorld();
  Red = loadImage("redcar.png");
  Purple = loadImage("purplecar.png");
  //makeRoad();
  //makeRoadBumper();
  PurpcarY = 300;
  PurpcarX = 400;
  RedcarX = 400;
  RedcarY = 500;
  lines = new ArrayList();

  makeRedCar();
  makePurpleCar();
}


void draw () {
  if (traffic != null) traffic.setVelocity(500, 0);


  if (frameCount % 20 == 0) {
    lines.add(new Road(x, y, s, w));
  }

  background(0);
  fill(grey);
  rect(0, 180, 800, 20);
  rect(0, 620, 800, 20);
  world.step();

  world.setGravity(0, 0);

  int i = 0;
  while ( i < lines.size()) {
    lines.get(i).show();
    lines.get(i).act();
    if (lines.get(i).onScreen == false)
      lines.remove(i);
    else
      i = i + 1;
  }
  world.draw();

  if (frameCount % 300 == 0) {

    makeTraffic();
  }

  if (wkey == true) {
    redcar.setVelocity(0, -100);
  }
  if (akey == true) {
    redcar.setVelocity(-100, 0);
  }
  if (dkey == true) {
    redcar.setVelocity(100, 0);
  }
  if (skey == true) {
    redcar.setVelocity(0, 100);
  }

  if (upkey == true) {
    purplecar.setVelocity(0, -100);
  }
  if (leftkey == true) {
    purplecar.setVelocity(-100, 0);
  }
  if (rightkey == true) {
    purplecar.setVelocity(100, 0);
  }
  if (downkey == true) {
    purplecar.setVelocity(0, 100);
  }


  //redcar.setPosition(RedcarX, RedcarY);
}
void createWorld() {
  //init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 0);
  //world.setEdges();
}

void makeTraffic() {
  traffic = new FBox(200, (random(100, 200)));
  traffic.setPosition(0, (random(200, 600)));
  traffic.setFillColor(red);
  traffic.setDensity(0.2);
  traffic.setFriction(0);
  traffic.setRestitution(0);
  traffic.setVelocity(900, 0);
  traffic.setRotatable(false);
  world.add(traffic);
}


//void makeRoadBumper() {
//  bump = new FPoly();
//  bump.setStatic(true);
//  bump.vertex(0, 180);
//  bump.vertex(800, 180);
//  bump.vertex(800, 200);
//  bump.vertex(0, 200);
//  bump.vertex(0, 600);
//  bump.vertex(800, 600);
//  bump.vertex(800, 620);
//  bump.vertex(0, 620);
//  bump.setFillColor(grey);
//  bump.setRestitution(1);
//  world.add(bump);
//}

void makeRedCar() {
  redcar = new FBox (100, 100);
  redcar.attachImage(Red);
  redcar.setPosition(RedcarX, RedcarY);
  redcar.setDensity(0.2);
  redcar.setFriction(0);
  redcar.setRestitution(0);
  redcar.setFillColor(red);
  redcar.setRotation(4.72);
  redcar.setRotatable(false);
  world.add(redcar);
}
void makePurpleCar() {
  purplecar = new FBox (200, 100);
  purplecar.attachImage(Purple);
  purplecar.setPosition(PurpcarX, PurpcarY);
  purplecar.setFillColor(purple);
  purplecar.setDensity(0.2);
  purplecar.setRotation(4.72);
  purplecar.setFriction(0);
  purplecar.setRestitution(0);
  purplecar.setRotatable(false);
  world.add(purplecar);
}
