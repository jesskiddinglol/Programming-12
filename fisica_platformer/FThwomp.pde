class FThwomp extends FGameObject {

  int frame = 0;
  int mode = 1;
  int timer = 100;
  FThwomp (float x, float y) {
    super();
    setPosition(x+16, y+15);
    setStatic(true);
    setName("tp");
  }

  void act() {
    animate();
  }
  void animate() {
    if(touchingPlayer()) {
      setStatic(false);
      mode ++;
    } 
    if(mode == 2) {
      attachImage(thwomp1);
      setVelocity(0, 10);
      timer ++;
    } else if(isTouching("stone")) {
      setVelocity(0, -50);
     // setPosition(
    }
  }

boolean touchingPlayer () {
 return player.getX() > tp.getX()-gridSize*1.1-gridSize && player.getX() < tp.getX()-gridSize*1.1+gridSize && player.getY() < tp.getY()+ gridSize && player.getY() > tp.getY() - gridSize;
}
}
