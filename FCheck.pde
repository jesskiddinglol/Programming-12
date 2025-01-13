class FCheck extends FGameObject {


  FCheck(float x, float y) {
    super();
    setPosition(x, y);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    collide();
    //println(ogX);
    attachImage(check0);
  }

  void collide() {
    if ( mode == GAME) {
      if (isTouching("player") && player.getY() < 450) {
        attachImage(check1);
        check1.resize(gridSize+2, gridSize+5);
        Flag.setPosition(100, 410);
        sense = true;
        ogX = 125;
        ogY= 445;
      }
    }
    if ( mode == GAME2) {
      if (isTouching("player") && player.getY() < 300 ) {
        attachImage(check1);
        check1.resize(gridSize+2, gridSize+5);
        Flag.setPosition(100, 153);
        sense = true;
        ogX = 100;
        ogY= 160;
      }
      if ( mode == GAME2) {
        if (isTouching("player") && player.getY() > 300 && player.getY()< 700) {
          attachImage(check1);
          check1.resize(gridSize+2, gridSize+5);
          Flag.setPosition(70, 664);
          sense = true;
          ogX = 85;
          ogY= 650;
        }
      }
      if ( mode == GAME2) {
        if (isTouching("player") && player.getY() > 800) {
          attachImage(check1);
          check1.resize(gridSize+2, gridSize+5);
          Flag.setPosition(868, 920);
          sense = true;
          ogX = 860;
          ogY = 946;
        }
      }
    }

    if (sense == true) {
      Flag.setDrawable(true);
    }

    if (isTouching("player") && player.getY() > 600 && mode == GAME) {
      ogX = 850;
      ogY= 700;
      Flag.setPosition(870, 700 );
      sense = true;
      attachImage(check1);
    }
    if (isTouching("player")) {
      sense = true;
    }
  }
}
