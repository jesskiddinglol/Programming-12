int mode;
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
    mode = waiting;
    setDensity(100);
    state = waiting;
    ogx = x+gridSize/2;
    ogy = y + gridSize/2;
  }

  void act() {
    animate();
  }
  void animate() {
    if (touchingPlayer()&& mode == waiting) {
      mode = falling;
    }
    if (mode == waiting) {
      setStatic(true);
      
      setVelocity(0, 0);
    }
    if (mode == falling) {
      setStatic(false);
      attachImage(thwomp1);
    }
    if (getY()>=ogy+ 120) {
      attachImage(thwomp0);
      mode = rising;
    }
    if (mode == rising && getY() <= 410) {
      setVelocity(0, -100);
    }
    if(abs(ogy - getY()) <1) {
      mode = waiting;
    }
    
  }
  //first thwomp at 1000 to 1060
  //second 1160 1220
  //third 1315 1380
  boolean touchingPlayer () {
    return player.getX() >  tp.getX() - gridSize &&  player.getX() < tp.getX() + gridSize && player.getY() > tp.getY();
  }
}
