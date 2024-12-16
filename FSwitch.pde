class FSwitch extends FGameObject {


  FSwitch(float x, float y) {
    super();
    setPosition(x, y);
    setStatic(true);
  }

  void act() {
    collide();
  }


  void collide() {
    if (isTouching("player")&& touched == true && player.getY() > getY()) {
      flip = true;
    }
    if (isTouching("player") && touched == false && player.getY() > getY()) {
      flip = false;
    }
    if (flip == false && touched == false) {
      attachImage(off);
      touched = true;
    }
    if (flip == true) {
      attachImage(on);
      touched = false;
    }
  }
}
