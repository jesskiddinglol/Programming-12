class FKoopa extends FGameObject {
  
  int frame;
  int speed = 50;
  int direction = R;
  
  FKoopa (float x, float y) {
  super();
  setPosition(x, y); 
  setName("kp");
}

void act() {
  animate();
  collide();
  move();
  
}


void animate() {
  if(frame >= koopa.length) frame = 0; 
    if(frameCount % 10 == 0) {
      koopa[frame].resize(32, 32);
     if (direction == R) {
        attachImage(koopa[frame]);
      }
      if (direction == L) {
        attachImage(reverseImage(koopa[frame]));
      }
      frame ++;
    }
  
}

void collide() {
    if (isTouching("kpwall")) {
      direction *= -1;
      setPosition(getX() + direction*1.5, getY());
    }
      if(isTouching("player")) {
      if(player.getY() < getY()-gridSize/2) {
      world.remove(this); 
      enemies.remove(this);
       enemies.add(sh);
        world.add(sh);
      player.setVelocity(player.getVelocityX(), -300);
      } else {
        lives = lives -1;
        player.setPosition(ogX, ogY);
        //game2ResetB();
      }
      }
}

void move () {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
  
}
  
