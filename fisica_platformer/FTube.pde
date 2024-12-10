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
      if (player.getY() < getY()-gridSize/2 && mode == GAME && rightkey == true) {
        setSensor(true);
        game2Setup();
        mode = GAME2;
      }
      if (player.getY() < getY()-gridSize/2 && mode == GAME2 && leftkey == true) {
        setSensor(true);
        //player.setPosition(32, 910);
        gameSetup();
        mode = GAME;
      }
      
    }
  }
}
