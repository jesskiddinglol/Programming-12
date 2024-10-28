import fisica.*;
FWorld world;
FPoly road;
FPoly bump;
int mode;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int GAMEOVER = 3;
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
PImage Truck;
PImage Truck2;
PImage Explosion;
boolean alive;
int timer;
int leftlife, rightlife;

void setup() {
  size(800, 800);
  createWorld();
  Red = loadImage("redcar.png");
  Purple = loadImage("purplecar.png");
  Truck = loadImage("truck.png");
  Truck2 = loadImage("truck2.png");
  Explosion = loadImage("explosion.png");
 //makeRoad();
  //makeRoadBumper();
  PurpcarY = 300;
  PurpcarX = 400;
  RedcarX = 400;
  RedcarY = 500;
  alive = true;
  lines = new ArrayList();
  timer = 10000;
  

  makeRedCar();
  makePurpleCar();
}


void draw () {
  if (traffic != null) traffic.setVelocity(700, 0);
  

  if (frameCount % 20 == 0) {
    lines.add(new Road(x, y, s, w));
  }

  background(0);
  fill(blue);
  rect(0, 0, 800, 180);
    rect(0, 620, 800, 180);
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
  
  timer = timer - 1;
  if(redcar.getY()> 660 || redcar.getY()< 140) {
    //redcar.setDrawable(false);
    //redcar.attachImage(Explosion);
    //redcar.setStatic(true);
    world.remove(redcar);
    alive = false;
  }
  if(purplecar.getY()> 660 || purplecar.getY()< 140) {
    //redcar.setDrawable(false);
    //purplecar.attachImage(Explosion);
    //purplecar.setStatic(true);
    world.remove(purplecar);
    alive = false;
  }
    if(redcar.getX()> width+20 || redcar.getX()< 0-20) {
    //redcar.setDrawable(false);
    //redcar.attachImage(Explosion);
    redcar.setSensor(true);
    redcar.setStatic(true);
    world.remove(redcar);
    alive = false;
  }
  if(purplecar.getX()> width+20 || purplecar.getX()< 0-20) {
    //redcar.setDrawable(false);
    //purplecar.attachImage(Explosion);
    world.remove(purplecar);
    alive = false;
  }
  
  text(timer, 300, 200, 20);
  if(timer <= 9900) {
  }
  

  
  if (frameCount % 150 == 0) {

    makeTraffic();
  }

  if (wkey == true) {
    redcar.setVelocity(0, -150);
  }
  if (akey == true) {
    redcar.setVelocity(-150, 0);
  }
  if (dkey == true) {
    redcar.setVelocity(150, 0);
  }
  if (skey == true) {
    redcar.setVelocity(0, 150);
  }

  if (upkey == true) {
    purplecar.setVelocity(0, -150);
  }
  if (leftkey == true) {
    purplecar.setVelocity(-150, 0);
  }
  if (rightkey == true) {
    purplecar.setVelocity(150, 0);
  }
  if (downkey == true) {
    purplecar.setVelocity(0, 150);
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
  traffic = new FBox(200, 70);
  traffic.setPosition(-100, (random(250, 550)));
  traffic.attachImage(Truck);
  Truck.resize(200, 200);
  traffic.setFillColor(red);
  traffic.setDensity(0.2);
  traffic.setFriction(0);
  traffic.setRestitution(0);
  traffic.setVelocity(900, 0);
  traffic.setRotatable(false);
  world.add(traffic);
}




void makeRedCar() {
  redcar = new FBox (75, 125);
  redcar.attachImage(Red);
 Red.resize(200, 200);
 Explosion.resize(150, 150);
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
  purplecar = new FBox (75, 125);
  purplecar.attachImage(Purple);
  purplecar.setPosition(PurpcarX, PurpcarY);
  purplecar.setFillColor(purple);
  Purple.resize(200, 200);
  purplecar.setDensity(0.2);
  purplecar.setRotation(4.72);
  purplecar.setFriction(0);
  purplecar.setRestitution(0);
  purplecar.setRotatable(false);
  world.add(purplecar);
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
