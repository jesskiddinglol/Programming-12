import fisica.*;
FWorld world;
FPoly road;
FPoly bump;
color blue = #00b4d8;
color black = #000000;
color grey = #495057;
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

void setup() {
  size(800, 800);
  createWorld();
  makeRoad();
makeRoadBumper();
PurpcarY = 300;
PurpcarX = 400;
RedcarX = 400;
RedcarY = 500;
  car1 = loadImage("redcar.png");
  car2 = loadImage("purplecar.png");
  lines = new ArrayList();
  //for(int i = 0; i < numLines; i ++) {
  //  lines.add(new Road(x, y, s, w));
  //}

  makeRedCar();
  makePurpleCar();
}


void draw () {
  if (frameCount % 20 == 0) {
    lines.add(new Road(x, y, s, w));
  }


  background(blue);
  world.draw();
  int i = 0;
  while ( i < lines.size()) {
    lines.get(i).show();
    lines.get(i).act();
    if (lines.get(i).onScreen == false)
      lines.remove(i);
    else
      i = i + 1;
  }
}
void createWorld() {
  //init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();

}

void makeRoad() {
  road = new FPoly();

  road.vertex(0, 200);
  road.vertex(800, 200);
  road.vertex(800, 600);
  road.vertex(0, 600);
  road.setStatic(true);
  road.setFillColor(black);
  road.setFriction(0);
  road.setStatic(true);

  world.add(road);
}

void makeRoadBumper() {
  bump = new FPoly();
  bump.vertex(0, 180);
  bump.vertex(800, 180);
  bump.vertex(800, 200);
  bump.vertex(0, 200);
  bump.vertex(0, 600);
  bump.vertex(800, 600);
  bump.vertex(800, 620);
  bump.vertex(0, 620);
  bump.setFillColor(grey);
  bump.setRestitution(1);
  
  world.add(bump);
}

void makeRedCar() {
  FBox redcar = new FBox (200, 200);
  redcar.setPosition(RedcarX, RedcarY);
  redcar.setRotation(4.72);
  car1.resize(200, 200);
  redcar.attachImage(car1);
  redcar.setDensity(0.2);
  redcar.setFriction(1);
  redcar.setRestitution(1);
  world.add(redcar);
}
void makePurpleCar() {
  FBox purplecar = new FBox (200, 200);
  purplecar.setPosition(PurpcarX, PurpcarY);
  purplecar.setRotation(4.72);
  car2.resize(200, 200);
  purplecar.attachImage(car2);
  purplecar.setDensity(0.2);
  purplecar.setFriction(1);
  purplecar.setRestitution(1);
  world.add(purplecar);
}
