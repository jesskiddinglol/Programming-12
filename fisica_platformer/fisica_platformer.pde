import fisica.*;
FWorld world;
final int L = -1;
final int R = 1;
int ogX;
int ogY;
int money;
//for hammer direction
int direction = L;
//color variables

color black = #000000;
color white = #FFFFFF;
color navy = #023047;
color red = #FF0000;
color iceBlue = #00b7ef;
color brown = #ff7e00;
color green = #a8e61d;
color purple = #6f3198;
color pink = #ffa3b1;
color grey = #464646;
color yellow = #fff200;
color blood = #990030;
color blue = #4d6df3;
color beige = #f5e49c;
color hammerwall = #ed1c24;
color mustard = #ffc20e;
color lavender = #b5a5d5;
color sky= #546d8e;
color forest = #22b14c;
color dull = #99d9ea;
//Images for terrain -------

PImage map;
PImage stone;
PImage ice;
PImage flag;
PImage treeTrunk, treeIntersect, treeMiddle, treeEndEast, treeEndWest, spike, bridge, trampoline, hammertime, thwomp0, thwomp1;

//Images for enemy ---------
PImage [] goomba;
PImage[]lava;
//PImage[]thwomp;
PImage [] hammerbro;
//Images for main character animations -------
PImage check0, check1;
PImage [] idle;
PImage [] jump;
PImage [] run;
PImage [] action;
PImage[]coin;

FBox hammer;
FBox Flag;
int gridSize = 32;
float zoom = 1.2;
boolean sense, sense1;
FPlayer player;
FHammerbro hb;
FCheck cp;
FThwomp tp;
//FThwompSensor ths;
FBox sensor;
//keyboard controls
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey;
int lives;

//objects and lists of objects
ArrayList <FGameObject> terrain;
ArrayList <FGameObject>  enemies;

void setup() {
  size(600, 600);
  ogX = 100;
  ogY = 100;
  money = 0;
  sense = false;
  sense1 = false;
  lives = 2;
  Fisica.init(this);
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  map = loadImage("map.png");
  stone = loadImage("images/brick.png");
  ice = loadImage("images/blueBlock.png");
  treeTrunk = loadImage("images/tree_trunk.png");
  treeIntersect = loadImage("images/tree_intersect.png");
  treeMiddle = loadImage("images/treetop_center.png");
  treeEndEast = loadImage("images/treetop_e.png");
  treeEndWest = loadImage("images/treetop_w.png");
  spike = loadImage("images/spike.png");
  bridge = loadImage("images/bridge_center.png");
  trampoline = loadImage("enemies/trampoline.png");
  hammertime = loadImage ("enemies/hammer.png");
  thwomp0 = loadImage("enemies/thwomp0.png");
  thwomp1 = loadImage("enemies/thwomp1.png");
  flag = loadImage("flag.png");
  check0 = loadImage("check0.png");
  check1 = loadImage("check1.png");

  //enemies-------------------
  goomba = new PImage[2];
  goomba[0] = loadImage("enemies/goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1]= loadImage("enemies/goomba1.png");
  goomba[1].resize(gridSize, gridSize);

  lava = new PImage[6];
  lava[0] = loadImage("images/lava0.png");
  lava[1] = loadImage("images/lava1.png");
  lava[2] = loadImage("images/lava2.png");
  lava[3] = loadImage("images/lava3.png");
  lava[4] = loadImage("images/lava4.png");
  lava[5] = loadImage("images/lava5.png");

  hammerbro = new PImage[2];
  hammerbro [0] = loadImage("enemies/hammerbro0.png");
  hammerbro [1] = loadImage("enemies/hammerbro1.png");

  //thwomp = new PImage[2];
  //thwomp [0] = loadImage("enemies/thwomp0.png");
  //thwomp [0].resize(gridSize*2, gridSize*2);
  //thwomp [1] = loadImage("enemies/thwomp1.png");
  //thwomp [1].resize(gridSize*2, gridSize*2);
  //load actions -----------
  idle = new PImage[2];
  idle[0] = loadImage("imageReverser/idle0.png");
  idle[1] = loadImage("imageReverser/idle1.png");
  jump = new PImage [1];
  jump [0] = loadImage("imageReverser/jump0.png");
  run = new PImage[3];
  run[0] = loadImage("imageReverser/runright0.png");
  run [1] = loadImage("imageReverser/runright1.png");
  run[2] = loadImage("imageReverser/runright2.png");

  coin = new PImage[4];
  coin [0] = loadImage("coin0.png");
  coin [1] = loadImage("coin1.png");
  coin [2] = loadImage("coin2.png");
  coin [3] = loadImage("coin3.png");

  action = idle;

  ice.resize(32, 32);
  loadWorld(map);
  loadPlayer();
}


void loadWorld(PImage img) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  for (int y = 0; y < img.height; y ++ ) {
    for (int x = 0; x < img.width; x ++) { //x ++ moves from one pixel across the row
      color c = img.get(x, y); //colour of current picture
      color s = img.get(x, y+1); //colour below current picture
      color w = img.get(x-1, y); //colour west of current pixel
      color e = img.get(x+1, y); //colour east of current pixel
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      b.setFriction(4);
      if (c == black) {
        b.setName("stone");
        b.attachImage(stone);
        world.add(b);
      } else if (c == iceBlue) {
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      } else if (c == brown) {
        b.attachImage(treeTrunk);
        b.setName("tree trunk");
        b.setSensor(true);
        world.add(b);
      } else if (c ==green && s ==brown) { //intersection
        b.attachImage(treeIntersect);
        b.setName("treetop");
        b.setSensor(true);
        world.add(b);
      } else if (c ==green && w == green && e == green) { //mid piece
        b.attachImage(treeMiddle);
        b.setName("treetop");
        b.setSensor(true);
        world.add(b);
      } else if (c ==green && w != green) { //west end cap
        b.attachImage(treeEndWest);
        b.setName("treetop");
        b.setSensor(true);
        world.add(b);
      } else if (c ==green && e != green) { //east end cap
        b.attachImage(treeEndEast);
        b.setName("treetop");
        b.setSensor(true);
        world.add(b);
      } else if (c == purple) {
        b.attachImage(spike);
        b.setName("spike");
        world.add(b);
      } else if ( c == pink) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        b.attachImage(bridge);
        world.add(br);
      } else if ( c == grey) {
        b.setName("walls");
        b.setDrawable(false);
        b.setSensor(true);
        world.add(b);
      } else if ( c == yellow) {
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      } else if ( c == blood) {
        b.setName("trampoline");
        b.setRestitution(1.6);
        b.attachImage(trampoline);
        world.add(b);
      } else if ( c == blue) {
        FLava lava = new FLava (x*gridSize, y*gridSize);
        b.setName("lava");
        enemies.add(lava);
        world.add(lava);
      } else if ( c == beige) {
        hb = new FHammerbro (x*gridSize, y*gridSize);
        enemies.add(hb);
        world.add(hb);
      } else if ( c == hammerwall) {
        b.setName("hammerwall");
        b.setDrawable(false);
        b.setSensor(true);
        world.add(b);
      } else if (c == mustard) {
        tp = new FThwomp (x*gridSize, y*gridSize);
        tp.attachImage(thwomp0);
        enemies.add(tp);
        world.add(tp);
      } else if ( c == sky) {
        FCoin coin = new FCoin(x*gridSize, y*gridSize);
        enemies.add(coin);
        world.add(coin);
      } else if (c == forest) {
        cp = new FCheck(x*gridSize, y*gridSize);
        check0.resize(gridSize, gridSize);
        enemies.add(cp);
        world.add(cp);
      } else if (c == dull) {
        Flag = new FBox (gridSize, gridSize);
        Flag.setSensor(true);
        Flag.attachImage(flag);
        flag.resize( 60, 80);
        Flag.setDrawable(false);
        Flag.setStatic(true);
        world.add(Flag);
      }
    }
  }
}


void loadPlayer() {
  player = new FPlayer();
  //player.setPosition(100, 400);
  player.setPosition(ogX, ogY);
  world.add(player);
}
void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i ++ ) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i ++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void makeHammer() {
  hammer = new FBox (gridSize, gridSize);
  hammer.attachImage(hammertime);
  hammer.setPosition(hb.getX(), hb.getY());
  hammer.setAngularVelocity(15);
  if (direction == R) hammer.setVelocity(100, -500);
  if (direction == L) hammer.setVelocity(-100, -500);
  hammer.setName("hammer");
  hammer.setSensor(true);
  hammer.setDrawable(true);
  world.add(hammer);
}


void makeSensor() {
  sensor = new FBox(gridSize*0.2, gridSize*0.3);
  sensor.setPosition(tp.getX(), tp.getY());
  sensor.setFillColor(white);
  //sensor.setStatic(true);
  world.add(sensor);
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
void draw() {
  background(black);
  textSize(30);
  //println("hi");

  drawWorld();
  player.act();
  actWorld();
  text(money, 50, 50);
  text(lives, 500, 50);
}

void gameReset() {
  ogX = 100;
  ogY = 100;
  lives = 2;
  sense = false;
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  world = new FWorld (-2000, -2000, 2000, 2000);
  money = 0;
  world.setGravity(0, 900);
  loadWorld(map);
  loadPlayer();
}
void gameReset1() {
  ogX = 100;
  ogY = 100;
  sense = false;
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  world = new FWorld (-2000, -2000, 2000, 2000);
  money = 0;
  world.setGravity(0, 900);
  loadWorld(map);
  loadPlayer();
}
