class FBoo extends FGameObject {

  int frame;
  int speed = 100;
  boolean go;
  int oldx;
  int oldy;
  //int direction = R;

  FBoo(float oldx, float oldy) {
    super();
    setPosition(oldx, oldy);
    setStatic(true);
    setSensor(true);
    setRotatable(false);
    go = false;
  }

  void act() {
    animate();
    collide();
    if (go == true) {
      move();
    }
    if (mode == GAME2 && direction == L && player.getX() < getX()) {
      go = true;
    }
    if (mode == GAME2 && direction == R && player.getX() < getX()) {
      go = false;
    }
  }
  void move() {
    setVelocity(speed*-1, player.getVelocityY());
  }


  void collide() {
    if (player.getX() < getX() - 40 && player.getY() > getY()-10) {
      setStatic(false);
      setDrawable(true);
      setSensor(false);
    }
    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        lives = lives -1;
        player.setPosition(ogX, ogY);
        setPosition(oldx, oldy);
        go = false;
        game2ResetB();
      }
    }
  }
  void animate() {
    happyboo.resize(40, 32);
    if (frame>= boo.length) frame = 0;
    if (frameCount % 5 == 0 ) {
        boo[frame].resize(32, 32);
      if (direction == L)
        attachImage(reverseImage(boo[frame]));
      frame ++;
    }
    if (direction == R) {
      attachImage(happyboo);
    }
  }
}
