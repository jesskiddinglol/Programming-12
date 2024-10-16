import fisica.*;
FWorld world;
FPoly road;
color blue = #00b4d8;
color black = #000000;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
float vx;
float x;



void setup() {
  size(800, 800);
  createWorld();
  makeRoad();
  vx = 10;
}


void draw () {
  background(blue);
  world.draw();


  makeLines(0, 380, 100, 20);
  x = x + vx;
  //makeLines(200, 380, 100, 20);
  //makeLines(400, 380, 100, 20);
  //makeLines(600, 380, 100, 20);
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

  world.add(road);
}

void makeLines( float x, int y, int s, int w) {
  fill(255);
  rect(x, y, s, w);
  x = x + vx;
}
//float x = 0;
//while (x < 800) {
//  rect(x, 380, 100, 20);
//  x = x + 400;
//}
//float x2 = 200;
//while (x2 < 800) {
//  rect(x2, 380, 100, 20);
//  x2 = x2 + 420;
//}


//if ( x > 800) x = -100;
