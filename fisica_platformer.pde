import fisica.*;
FWorld world;
final int L = -1;
final int R = 1;
int mode;
final int INTRO =1;
final int GAME =2;
final int GAME2 = 3;
final int GAMEOVER = 4;
int ogX;
int ogY;
float timer;
int money;
boolean kpremoved;
boolean go;
boolean tm;
boolean done;
//for hammer direction
int direction = L;
//color variables---------
boolean flip;
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
color purp = #7c4dff;
color blue = #4d6df3;
color beige = #f5e49c;
color hammerwall = #ed1c24;
color mustard = #ffc20e;
color lavender = #b5a5d5;
color sky= #546d8e;
color forest = #22b14c;
color dull = #99d9ea;
color bark = #9c5a3c;
color lips = #e68383;
color sunset = #ff9800;
color midnight = #736feb;
color grass = #91913f;
color tan = #ffcd94;
color blush = #e91e63;
color lime = #e6ee9c;
color cloud = #18ffff;
color matte = #f8bbd0;
//Images for terrain -------

PImage map1, map2;
PImage on, off;
PImage happyboo;
PImage stone;
PImage ice;
PImage flag;
PImage ocean;
PImage fireball;
PImage treeTrunk, treeIntersect, treeMiddle, treeEndEast, treeEndWest, spike, bridge, trampoline, hammertime, thwomp0, thwomp1, tubey;

//Images for enemy ---------
PImage [] goomba;
PImage[]lava;
//PImage[]thwomp;
PImage [] hammerbro;
//Images for main character animations -------
PImage [] idle;
PImage [] jump;
PImage [] run;
PImage [] action;
//Images for mario enemies and array lists -------
PImage[]coin;
PImage[] koopa;
PImage coiny;
PImage [] shell;
PImage[]boo;
PImage [] mark;
PImage newmark;
PImage heart1, heart2, heart3;
PImage fireflwr;
PImage clouds;
PImage check0, check1;
boolean changeWorld;

int gridSize = 32;
float zoom = 1.2;
boolean sense, sense1;
boolean touched;
PFont mario;

//FObjects------------
FPlayer player;
FHammerbro hb;
FCheck cp;
FThwomp tp;
FKoopa kp;
FShell sh;
FCircle hearts;
FBox hammer;
FBox fireballs;
FBoo booo;
FBox Flag;
FFlower flower;
//FFire fire;
FMark qm;

Button [] myButtons;
boolean mouseReleased;
boolean wasPressed;

FBox sensor;
//keyboard controls
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey;
int lives;
//objects and lists of objects
ArrayList <FGameObject> terrain;
ArrayList <FGameObject>  enemies;

void setup() {
  size(600, 600);
  mode = INTRO;
  myButtons = new Button [2];
  myButtons [0] = new Button("START", 150, 400, 300, 100, midnight, sunset);
  //myButtons [1] = new Button("PLAY", 190, 400, 300, 100, midnight, sunset);
  changeWorld = false;
  ogX = 100;
  ogY = 900;
  money = 0;
  go = true;
  timer = 0;
  sense = false;
  sense1 = false;
  done = false;
  flip = false;
  touched = false;
  kpremoved = false;
  tm = false;
  mario = createFont("mario.ttf", 40);
  lives = 4;
  Fisica.init(this);
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  map1 = loadImage("map.png");
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
  check0 = loadImage("images/check0.png");
  check1 = loadImage("images/check1.png");
  tubey = loadImage("tube.png");
  map2 = loadImage("heh.png");
  on = loadImage("switch.png");
  off = loadImage("switch2.png");
  happyboo = loadImage("images/happyboo.png");
  newmark = loadImage("images/newmark.png");
  fireflwr = loadImage("images/fireflwr.png");
  ocean = loadImage("images/blue.png");
  fireball = loadImage("fireball.png");
  clouds = loadImage("cloud.png");

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


  koopa = new PImage[5];
  koopa [0] = loadImage("images/koopa0.png");
  koopa [1] = loadImage("images/koopa1.png");
  koopa [2] = loadImage("images/koopa2.png");
  koopa [3] = loadImage("images/koopa3.png");
  koopa [4] = loadImage("images/koopa4.png");

  shell = new PImage[4];
  shell [0] = loadImage("images/shell0.png");
  shell [1] = loadImage("images/shell1.png");
  shell [2] = loadImage("images/shell2.png");
  shell [3] = loadImage("images/shell3.png");

  boo = new PImage[4];
  boo[0] = loadImage("images/boo0.png");
  boo[1] = loadImage("images/boo1.png");
  boo[2] = loadImage("images/boo2.png");
  boo[3] = loadImage("images/boo3.png");

  mark = new PImage [4];
  mark [0] = loadImage("images/mark0.png");
  mark [1] = loadImage("images/mark1.png");
  mark [2] = loadImage("images/mark2.png");
  mark [3] = loadImage("images/mark3.png");


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

  //coins and lives --------
  coin = new PImage[4];
  coin [0] = loadImage("images/coin0.png");
  coin [1] = loadImage("images/coin1.png");
  coin [2] = loadImage("images/coin2.png");
  coin [3] = loadImage("images/coin3.png");

  heart1 = loadImage("heart.png");
  heart2 = loadImage("heart.png");
  heart3 = loadImage("heart.png");


  action = idle;


  ice.resize(32, 32);

  gameReset();
  if (mode == GAME2) {
    game2Setup();
  }
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
      } else if (c == bark) {
        FTube tube = new FTube (x*gridSize, y*gridSize);
        tube.attachImage(tubey);
        tube.setFriction(4);
        enemies.add(tube);
        world.add(tube);
      } else if (c == lips) {
        FSwitch sw = new FSwitch(x*gridSize, y*gridSize);
        sw.attachImage(off);
        enemies.add(sw);
        world.add(sw);
      } else if (c == sunset) {
        kp = new FKoopa(x*gridSize, y*gridSize);
        enemies.add(kp);
        world.add(kp);
      } else if (c == midnight) {
        b.setDrawable(false);
        b.setName("kpwall");
        b.setStatic(true);
        b.setSensor(true);
        world.add(b);
      } else if (c == grass) {
        sh = new FShell(x*gridSize, y*gridSize);
      } else if (c == tan) {
        b.setDrawable(false);
        b.setName("shellwall");
        b.setStatic(true);
        b.setSensor(true);
        world.add(b);
      } else if ( c == blush) {
        booo = new FBoo(x*gridSize, y*gridSize);
        booo.setDrawable(false);
        world.add(booo);
        enemies.add(booo);
      } else if ( c == purp) {
         qm = new FMark (x*gridSize, y*gridSize);
        world.add(qm);
        enemies.add(qm);
      } else if ( c == lime ) {
        flower = new FFlower(x*gridSize, y*gridSize);
        if(tm == false) {
        flower.attachImage(ocean);
        ocean.resize(32, 32);
        flower.setSensor(true);
        }
        world.add(flower);
      } else if (c == cloud) {
        b.attachImage(clouds);
        clouds.resize(200, 92);
        b.setStatic(true);
        b.setSensor(true);
        world.add(b);
      //} else if (c == matte) {
      //  fire = new FFire(x*gridSize, y*gridSize);
      //  fire.attachImage(fireball);
      //}
    }
    }
  }
}



void loadPlayer() {
  player = new FPlayer();
  //player.setPosition(ogX, ogY);
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

void makeFireball() {
  fireballs = new FBox (gridSize, gridSize);
  fireball.resize(32, 32);
  fireballs.attachImage(fireball);
    fireballs.setAngularVelocity(15);
  if(direction == R) {
  fireballs.setPosition(player.getX() + 100, player.getY());
  fireballs.setVelocity(100, -20);
  }
  if(direction == L) {
  fireballs.setPosition(player.getX() - 100, player.getY());
  fireballs.setVelocity(-100, -20);
  }
  fireballs.setName("fireballs");
  world.add(fireballs);
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
  click();

  if (mode == GAME) {
    background(black);
  }
  if (mode == GAME2) {
    background(blue);
  }

  if (mode == GAME || mode == GAME2) {
    textSize(30);
    //println("hi");
    drawWorld();
    player.act();
    actWorld();
    coiny = loadImage("images/coin0.png");
    image(coiny, 50, 50);
    text("=", 95, 75);
    text(money, 130, 75);
    text(lives, 500, 75);
  }
  //println(mode);

  if (mode==INTRO) {
    //println("abcd");
    intro();
  } else if (mode ==GAME) {
    game();
  } else if (mode ==GAME2) {
    game2();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error:" + mode);
  }
}

void gameReset() {
  ogX = 100;
  ogY = 100;
  lives = 4;
  sense = false;
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  world = new FWorld (-2000, -2000, 2000, 2000);
  money = 0;
  world.setGravity(0, 900);
  loadWorld(map1);
  loadPlayer();
  //player.setPosition(100, 100);
}

void gamePipe () {
  flip = false;
  touched = false;
  ogX = 32;
  ogY = 910;
  //lives = 2;
  sense = false;
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  world = new FWorld (-2000, -2000, 2000, 2000);
  // money = 0;
  world.setGravity(0, 900);
  loadWorld(map1);
  loadPlayer();
}
void game2Reset() {
  flip = false;
  touched = false;
  tm = false;
  ogX = 32;
  done = false;
  ogY = 150;
  sense = false;
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  loadWorld(map2);
  loadPlayer();
}
void game2ResetB() {
  flip = false;
  touched = false;
  tm = false;
  ogX = 70;
  ogY = 170;
  done = false;
  sense = false;
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  world = new FWorld (-2000, -2000, 2000, 2000);
  money = 0;
  world.setGravity(0, 900);
  loadWorld(map2);
  loadPlayer();
}
void gameReset1() {
  flip = false;
  touched = false;
  ogX = 100;
  ogY = 100;
  sense = false;
  terrain = new ArrayList <FGameObject> ();
  enemies = new ArrayList <FGameObject> ();
  world = new FWorld (-2000, -2000, 2000, 2000);
  money = 0;
  world.setGravity(0, 900);
  loadWorld(map1);
  loadPlayer();
}
