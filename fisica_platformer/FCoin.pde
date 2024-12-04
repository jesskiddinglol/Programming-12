class FCoin extends FGameObject {

  int frame = 0;
  int money;
  FCoin( float x, float y) {
    super();
    setPosition(x, y);
    setName("coin");
    setStatic(true);
    money = 0;
  }
  void act() {
    collide();
    animate();
  }
  
  void collide() {
     if(isTouching("player")) {
       money = money + 1;
       world.remove(this);
       enemies.remove(this);
     }
    
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
