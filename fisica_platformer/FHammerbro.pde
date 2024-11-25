class FHammerbro extends FGameObject {

  int frame = 0;
  int speed = 50;

  FHammerbro(float x, float y) {
    super();
    setPosition(x, y);
    setRotatable(false);
    setName("hbr");
  }

  void act () {
    animate();
    collide();
    move();
  }
  void animate() {
    if (frame >= hammerbro.length) frame = 0;
    if (frameCount % 10 == 0) {
      if (direction == R) {
        attachImage(hammerbro[frame]);
      }
      if (direction == L) {
        attachImage(reverseImage(hammerbro[frame]));
      }
      frame ++;
      //println(frame);
    }
  }

  void collide () {
    if (isTouching("hammerwall")) {
      direction *= -1;
      setPosition(getX() + direction*1.5, getY());
      makeHammer();
    }
  }

  void move () {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
