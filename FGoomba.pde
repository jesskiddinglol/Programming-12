class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0; //frame of animation

  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }


  void animate() {
    if (frame>= goomba.length) frame = 0;
    if (frameCount % 5 == 0 ) {
      if (direction == R) attachImage(goomba[frame]);
      if (direction == L) attachImage(reverseImage(goomba[frame]));
      frame ++;
    }
  }

  void collide() {
    if (isTouching("walls")) {
      direction *= -1; //switch direction to switch direction
      setPosition(getX() +  direction*3, getY()); //allows to not run into wall
    }
    if(mode == GAME &&isTouching("player")) {
      if(player.getY() < getY()-gridSize/2) {
      world.remove(this); 
      enemies.remove(this);
      player.setVelocity(player.getVelocityX(), -300);
      } else {
        lives = lives -1;
        player.setPosition(ogX, ogY);
       // println("w");
        //gameReset();
      }
    }
    if(mode == GAME2 && isTouching("player") && player.getY() < 200) {
      if(player.getY() < getY()-gridSize/2) {
      world.remove(this); 
      enemies.remove(this);
      player.setVelocity(player.getVelocityX(), -300);
      } else {
        lives = lives -1;
        player.setPosition(ogX, ogY);
        game2ResetB();
        //println("o");
      }
    }
    if(mode == GAME2 && isTouching("player") && player.getY () > 300) {
      if(player.getY() < getY()-gridSize/2) {
      world.remove(this); 
      enemies.remove(this);
      player.setVelocity(player.getVelocityX(), -300);
      } else {
        lives = lives -1;
        player.setPosition(ogX, ogY);
        //println("o");
      }
    }
    if(isTouching("shell")){
      world.remove(this);
      enemies.remove(this);
      
    }
    
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
