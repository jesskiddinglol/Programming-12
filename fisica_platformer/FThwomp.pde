
final int waiting = 1;
final int falling = 2;
final int rising = 3;

class FThwomp extends FGameObject {
  int state;
  float ogx, ogy;

  FThwomp (float x, float y) {
    super();
    setPosition(x+gridSize/2, y+gridSize/2);
    setRotatable(false);
    setStatic(true);
    setName("tp");
    state = waiting;
    setDensity(100);
    state = waiting;
    ogx = x+gridSize/2;
    ogy = y + gridSize/2;
  }

  void act() {
    animate();
  }
  void animate() {
    if (touchingPlayer()&& state == waiting) {
      state = falling;
    }
    if (state == waiting) {
      setStatic(true);

      setVelocity(0, 0);
    }
    if (state == falling) {
      setStatic(false);
      attachImage(thwomp1);
    }
    if (getY()>=ogy+ 160) {
      attachImage(thwomp0);
      state = rising;
    }
    if (state == rising && getY() <= 700) {
      setVelocity(0, -70);
    }
    if (abs(ogy - getY()) <1) {
      state = waiting;
    }
  }
  //first thwomp at 1000 to 1060
  //second 1160 1220
  //third 1315 1380
  boolean touchingPlayer () {
    return player.getX() >  getX() - gridSize &&  player.getX() < getX() + gridSize && player.getY() > getY() &&  player.getY() < 750;
  }
}
