class FTube extends FGameObject {

  FTube(float x, float y) {
    super();
    setPosition(x, y);
    setStatic(true);
  }

  void act () {
    collide();
  }

  void collide() {
    if (isTouching("player")) {  
      if (mode == GAME && player.getY() < getY()-gridSize/2 && rightkey == true) {
        setSensor(true);
        game2Reset();
        mode = GAME2;
      }
      if (mode == GAME2 && player.getY() < getY()-gridSize/2  && leftkey == true) {
        setSensor(true);
        //player.setPosition(32, 910);
        //gameReset();
        gamePipe();
        mode = GAME;
      }
      
    }
  }
}
