class FCoin extends FGameObject {

  int frame = 0;

  FCoin( float x, float y) {
    super();
    setPosition(x, y);
    setName("coin");
    setStatic(true);
  }
  void act() {
    collide();
    animate();
  }

  void collide() {
    if (isTouching("player")) {
      money = money + 1;
      world.remove(this);
      enemies.remove(this);
    }
    //if (sense == true) {
    //  money = money + 1;
    //} else {
    //  money = 0;
    //}
  }

  void animate() {
    if (frame >= coin.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(coin[frame]);
      coin[frame].resize(32, 32);
      frame ++;
      //println(frame);
    }
  }
}
