import fisica.*;
FWorld world;
FPoly road;
FPoly bump;
int mode;
final int INTRO = 1;
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
FCircle heart1;
FCircle heart2;
FCircle heart3;
FCircle heart1P;
FCircle heart2P;
FCircle heart3P;
PImage Red;
PImage Purple;
PImage Truck;
PImage Truck2;
PImage Explosion;
PImage Heart;
PImage HeartP;
boolean alive;
int timer;
float leftlife, rightlife;
float change;

void setup() {
  size(800, 800);
  createWorld();
  Red = loadImage("redcar.png");
  Purple = loadImage("purplecar.png");
  Truck = loadImage("truck.png");
  Truck2 = loadImage("truck2.png");
  Explosion = loadImage("explosion.png");
  Heart = loadImage("heart.png");
  HeartP = loadImage("heartP.png");
mode = GAME;
  //makeRoad();
  //makeRoadBumper();
  PurpcarY = 300;
  PurpcarX = 400;
  RedcarX = 400;
  RedcarY = 500;
  alive = true;
  lines = new ArrayList();
  timer = 10000;
  leftlife = 10;
  rightlife = 10;
  change = random(0, 3);


  makeRedCar();
  makePurpleCar();
  heart();
  heartP();
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
  if (redcar.getY()> 660 || redcar.getY()< 140) {
    world.remove(redcar);
    alive = false;
  }
  if (purplecar.getY()> 660 || purplecar.getY()< 140) {
    world.remove(purplecar);
    alive = false;
  }
  if (redcar.getX()> width+20 || redcar.getX()< 0-20) {
    redcar.setSensor(true);
    redcar.setStatic(true);
    world.remove(redcar);
    alive = false;
  }
  if (purplecar.getX()> width+20 || purplecar.getX()< 0-20) {
    //redcar.setDrawable(false);
    //purplecar.attachImage(Explosion);
    world.remove(purplecar);
    alive = false;
  }
  //textSize(50);
  //text(leftlife, 300, 200, 20);
  //text(rightlife, 600, 200, 20);
  if (timer <= 9900) {
  }

if(alive == false) {
  mode = GAMEOVER;
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

  if (hitTruck(redcar)) {
    leftlife = leftlife - 0.1;
  }
  if (hitTruck(purplecar)) {
    rightlife = rightlife - 0.1;
  }
  //redcar.setPosition(RedcarX, RedcarY);
  if (leftlife <=8) {
    heart1.setDrawable(false);
  }
  if (leftlife <= 6) {
    heart2.setDrawable(false);
  }

  if (leftlife <= 4) {
    heart3.setDrawable(false);
  }

  if (rightlife <=8) {
    heart1P.setDrawable(false);
  }
  if (rightlife <= 6) {
    heart2P.setDrawable(false);
  }

  if (rightlife <= 4) {
    heart3P.setDrawable(false);
  }
  
  if(rightlife <=3 ) {
    mode = GAMEOVER;
  }
  if(leftlife <=3 ) {
    mode = GAMEOVER;
  }
  
    if (mode==INTRO) {
    intro();
  } else if (mode ==GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error:" + mode);
  }
}
