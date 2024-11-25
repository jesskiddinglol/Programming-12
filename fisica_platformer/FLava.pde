class FLava extends FGameObject {

  int  frame = 0;
  FLava (float x, float y) {
    super();
    setPosition(x, y);
    setRotatable(false);
    
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
    if (isTouching("player")) {
      player.setPosition(0, 0);
    }
  }
}
