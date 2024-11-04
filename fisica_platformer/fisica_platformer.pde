import fisica.*;
FWorld world;

int gridSize = 32;

void setup() {
  size(800, 800);
  Fisica.init(this);
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
}


void draw() {
  world.step();
  world.draw();
}
