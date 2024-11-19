import fisica.*;
FWorld world;

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
//Images for terrain -------

PImage map;
PImage stone;
PImage ice;
PImage treeTrunk, treeIntersect, treeMiddle, treeEndEast, treeEndWest, spike, bridge, trampoline;

//Images for enemy ---------
PImage [] goomba;
PImage[]lava;
//Images for main character animations -------

PImage [] idle;
PImage [] jump;
PImage [] run;
PImage [] action;


int gridSize = 32;
float zoom = 1.5;
FPlayer player;

//keyboard controls
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey;

//objects and lists of objects
ArrayList <FGameObject> terrain;
ArrayList <FGameObject>  enemies;
void setup() {
  size(600, 600);


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
        world.add(b);
      } else if (c ==green && w == green && e == green) { //mid piece
        b.attachImage(treeMiddle);
        b.setName("treetop");
        world.add(b);
      } else if (c ==green && w != green) { //west end cap
        b.attachImage(treeEndWest);
        b.setName("treetop");
        world.add(b);
      } else if (c ==green && e != green) { //east end cap
        b.attachImage(treeEndEast);
        b.setName("treetop");
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
        b.attachImage(stone);
        world.add(b);
      } else if ( c == yellow) {
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      } else if ( c == blood) {
        b.setName("trampoline");
        b.setRestitution(1.3);
        b.attachImage(trampoline);
        world.add(b);
      } else if ( c == blue) {
        FLava lava = new FLava (x*gridSize, y*gridSize);
        b.setName("lava");
        enemies.add(lava);
        world.add(lava);
      }
    }
  }
}


void loadPlayer() {
  player = new FPlayer();
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
  drawWorld();
  player.act();
  actWorld();
}
