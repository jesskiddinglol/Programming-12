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
    if (isTouching("player") && player.getY() < 450) {
      attachImage(check1);
      check1.resize(gridSize+2, gridSize+5);
       Flag.setPosition(100, 410);
      sense = true;
      ogX = 125;
      ogY= 445;
    }
    
    if(sense == true) {
      Flag.setDrawable(true);
    }

    if (isTouching("player") && player.getY() > 600) {
      ogX = 850;
      ogY= 700;
       Flag.setPosition(870, 700 );
      sense = true;
      attachImage(check1);
    }
    if(isTouching("player")) {
      sense = true;
    }
  }
}
