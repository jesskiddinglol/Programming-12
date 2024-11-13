import fisica.*;
FWorld world;

color black = #000000;
color white = #FFFFFF;
color navy = #023047;
color red = #FF0000;
color iceBlue = #00b7ef;
color brown = #ff7e00;
color green = #a8e61d;
color purple = #6f3198;
PImage map;
PImage stone;
PImage ice;
PImage treeTrunk, treeIntersect, treeMiddle, treeEndEast, treeEndWest, spike, bridge;
int gridSize = 32;
float zoom = 1.3;
FPlayer player;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey;

void setup() {
  size(600, 600);


  Fisica.init(this);

  map = loadImage("map.png");
  stone = loadImage("images/brick.png");
  ice = loadImage("images/blueBlock.png");
  treeTrunk = loadImage("images/tree_trunk.png");
  treeIntersect = loadImage("images/tree_intersect.png");
  treeMiddle = loadImage("images/treetop_center.png");
  treeEndEast = loadImage("images/treetop_e.png");
  treeEndWest = loadImage("images/treetop_w.png");
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

      if (c == black) {
        b.setName("stone");
        b.attachImage(stone);
        b.setFriction(4);
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
        // b.attachImage(treeEndEast);
        b.setName("spike");
        world.add(b);
      }
    }
  }
}


void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}
//void actWorld() {
//  player.act();
//  for (int i = 0; i < terrain.size(); i ++ ) {
//    FBox b = terrain.get(i);
//    if (b instanceof FBridge) ((FBridge) b).act();
//  }
//}
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
}
