import fisica.*;
FWorld world;

color black = #000000;
color white = #FFFFFF;
PImage map;
int gridSize = 32;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey;

void setup() {
  size(600, 600);
  background(white);

  Fisica.init(this);

  map = loadImage("map.png");
  loadWorld(map);
}


void loadWorld(PImage img) {
    world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  for (int y = 0; y < img.height; y ++ ) {
    for (int x = 0; x < img.width; x ++) { //x ++ moves from one pixel across the row
      color c = img.get(x, y);
      if (c == black) {
        pushMatrix();
        translate(x, y);
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setGrabbable(false);
        popMatrix();
        world.add(b);
      }
    }
  }
}


void draw() {
  world.step();
  world.draw();
}
