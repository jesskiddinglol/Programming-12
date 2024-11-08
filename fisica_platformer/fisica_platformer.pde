import fisica.*;
FWorld world;

color black = #000000;
color white = #FFFFFF;
color navy = #023047;
color red = #FF0000;
PImage map;
PImage stone;
PImage ice;
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
  loadWorld(map);
  loadPlayer();
}


void loadWorld(PImage img) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  for (int y = 0; y < img.height; y ++ ) {
    for (int x = 0; x < img.width; x ++) { //x ++ moves from one pixel across the row
      color c = img.get(x, y);
      if (c == black) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("stone");
        b.attachImage(stone);
        b.setFill(0);
        world.add(b);
      }
    }
  }
}


void loadPlayer() {
  player = new FPlayer();
  world.add(player);
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
  background(white);
  drawWorld();
  player.act();
}
