import fisica.*;
FWorld world;
FPoly road;
FPoly bump;
int mode;
PFont cool;
PFont flag;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
color blue = #00b4d8;
color black = #000000;
color grey = #495057;
color purple = #5a189a;
color red = #d00000;
color yellow = #ffbe0b;
color blood = #6a040f;
color navy = #003566;
color beige = #c7a17d;
color brown = #915c27;
color white = #ffffff;
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
boolean aliveP;
int timer;
float leftlife, rightlife;
float change;
boolean mouseReleased;
boolean wasPressed;
Button [] myButtons;
Gif cars;
 
void setup() {
  size(800, 800);
  cool = createFont("cool.ttf", 150);
    flag = createFont("flag.ttf", 100);
  myButtons = new Button [3];
  myButtons [0]= new Button("START", 250, 600, 300, 100, blood, brown);
  myButtons [1]= new Button("PLAY AGAIN", 250, 500, 300, 100, white, purple);
   myButtons [2]= new Button("PLAY AGAIN", 250, 500, 300, 100, white, red);
  cars = new Gif("gif/frame_", "_delay-0.04s.gif", 17, 3, 0, 0, width, height);
  createWorld();
  Red = loadImage("redcar.png");
  Purple = loadImage("purplecar.png");
  Truck = loadImage("truck.png");
  Truck2 = loadImage("truck2.png");
  Explosion = loadImage("explosion.png");
  Heart = loadImage("heart.png");
  HeartP = loadImage("heartP.png");
  mode = INTRO;
  //makeRoad();
  //makeRoadBumper();
 textAlign(CENTER, CENTER);
  lines = new ArrayList();
}


void draw () {
  click();
  if (traffic != null) traffic.setVelocity(400, 0);


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



  if (wkey == true) {
    redcar.setVelocity(0, -120);
  }
  if (akey == true) {
    redcar.setVelocity(-120, 0);
  }
  if (dkey == true) {
    redcar.setVelocity(120, 0);
  }
  if (skey == true) {
    redcar.setVelocity(0, 120);
  }

  if (upkey == true) {
    purplecar.setVelocity(0, -120);
  }
  if (leftkey == true) {
    purplecar.setVelocity(-120, 0);
  }
  if (rightkey == true) {
    purplecar.setVelocity(120, 0);
  }
  if (downkey == true) {
    purplecar.setVelocity(0, 120);
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
