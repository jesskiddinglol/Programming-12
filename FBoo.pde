class FBoo extends FGameObject {

  int frame;
  int direction = L;
  int speed = 100;
  boolean go;
  FBoo(float x, float y) {
    super();
    setPosition(x, y);
    setStatic(true);
    setRotatable(false);
    go = false;
  }

  void act() {
    animate();
    collide();
    if (go == true) {
      move();
    }
  }
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }


  void collide() {
    if (player.getX() < 760 && player.getY() > 200) {
      setStatic(false);
      setDrawable(true);
      setSensor(false);
      go = true;
    }
  }
  void animate() {

    if (frame>= boo.length) frame = 0;
    boo[frame].resize(32, 32);
    if (frameCount % 5 == 0 ) {
      if (direction == R) attachImage(boo[frame]);
      if (direction == L) attachImage(reverseImage(boo[frame]));
    }
    frame ++;
  }
}
