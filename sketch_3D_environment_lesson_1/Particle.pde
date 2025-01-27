class Particle extends FGameObject {

  PVector dir;
  float size;
  float speed;
  float vx, vy, vz;
  float a;
  boolean stopped;
  Particle(PVector b) {
    super(b.x, b.y, b.z);
    stopped = false;

    a = 255;
    size = random(7, 10);
    speed = 3;

    float scatterX = random(-PI, PI);
    float scatterY = random(-PI, PI);
    float scatterZ = random(-PI, PI);

    dir = new PVector (scatterX, scatterY, scatterZ);
    dir.setMag(speed);
  }

  void act() {
    if (stopped == false) {
      loc.add(dir);
      int hitx = int(loc.x+2000)/ gridSize;
      int hity = int(loc.z+2000)/gridSize;

      if (map.get(hitx, hity) == white) {
        stopped =  true;
      }
    }
  }



  void show() {
    if (stopped) {
      a = max(a -1, 0);
    }
    fill(255, a);
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    box(size);
    popMatrix();
  }
}
