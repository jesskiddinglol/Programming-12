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
      if (player.getY() < getY()-gridSize/2) {
        setSensor(true);
        player.setVelocity(0, 300);
      } 
      }
    }
  }
