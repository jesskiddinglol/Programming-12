class FBullet extends FGameObject {

  PVector dir;
  float speed;
  int size;

  FBullet() {
    super(eyeX, eyeY, eyeZ); //calling constructor from super class
    speed = 50;
    size = 15;
    float vx = cos(leftRightHeadAngle); //global variable
    float vy = tan(upDownHeadAngle);
    float vz = sin(leftRightHeadAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed); //direction set magnitude speed
  }

  void act() {
    int hitx = int(loc.x+2000)/ gridSize;
    int hity = int(loc.z+2000)/gridSize;
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0;
      for (int i = 0; i < 5; i ++) {
        objects.add(new Particle(loc));     
      }
    }
  }


  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(white);
    stroke(100);
    box(size);
    popMatrix();
  }
}
