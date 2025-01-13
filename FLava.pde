class FLava extends FGameObject {

  int  frame = 0;
  FLava (float x, float y) {
    super();
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
  }
  void act() {
    animate();
    collide();
  }
  void animate() {
    if (frame >= lava.length) frame = 0;
    if (frameCount % 10 == 0) {
      attachImage(lava[frame]);
      lava[frame].resize(32, 32);
      frame ++;
      //println(frame);
    }
  }
  void collide() {
    if (isTouching("player") && mode == GAME) {
      player.setPosition(ogX, ogY);
      lives = lives -1;
      gameReset1();
    }
     if (isTouching("player") && mode == GAME2) {
      player.setPosition(ogX, ogY);
      lives = lives -1;
      player.setPosition(ogX, ogY);
    }
  }
}
