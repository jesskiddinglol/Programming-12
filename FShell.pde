class FShell extends FGameObject {

  int frame;
  int direction = R;
  int speed = 250;

  FShell(float x, float y) {
    super();
    setPosition(x, y-10);
    setRotatable(false);
    setName("shell");
    //setStatic(true);
    //setSensor(true);
  }

  void act() {
    animate();
    collide();
    move();
  }
  void animate() {
    if (frame >=shell.length) frame = 0;
    {
      if (frameCount % 10 == 0) {
        shell[frame].resize(32, 32);
        if (direction == R) {
          attachImage(shell[frame]);
        }
        if (direction == L) {
          attachImage(reverseImage(shell[frame]));
        }
        frame ++;
      }
    }
  }

  void collide() {
   
    if (getX() > 860 && getY()< 200) {
      world.remove(this);
      enemies.remove(this);
    }
  }
  void move () {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
