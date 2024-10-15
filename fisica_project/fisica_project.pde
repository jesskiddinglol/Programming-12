import fisica.*;
FWorld world;
FPoly road;
color blue = #00b4d8;
color black = #000000;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
void setup() {
  size(800, 800);
  createWorld();
    makeRoad();
}


void draw () {
  background(blue);
world.draw();
  
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

void makeLines() {
  
  
  
  
}
