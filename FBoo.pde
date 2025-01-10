class FBoo extends FGameObject {

  int frame;
  int direction = L;
  int speed = 100;

  FBoo(float x, float y) {
    super();
    setPosition(x, y);
    setStatic(true);
    setSensor(true);
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    if (go == true) {
      move();
    }
    if(go == false) {
      booo.attachImage(happyboo);
      happyboo.resize(40, 32);
    }
  }
  void move() {
    //float vy = getVelocityY();
    setVelocity(speed*direction, player.getVelocityY());
  }


  void collide() {
    if (player.getX() < 810 && player.getY() > 200) {
      setStatic(false);
      setDrawable(true);
      setSensor(false);
    }
     if (isTouching("player") && player.getX() < 810) {
      if(player.getY() < getY()-gridSize/2) {
      world.remove(this); 
      enemies.remove(this);
      player.setVelocity(player.getVelocityX(), -300);
      } else {
        lives = lives -1;
        player.setPosition(ogX, ogY);
        game2ResetB();
      }
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
