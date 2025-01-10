class FMark extends FGameObject {

  int frame;

  FMark(float x, float y) {
    super();
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    setName("qm");
  }

  void act() {
    animate();
    move();
  }

  void animate() {
    if (frame >= mark.length) frame = 0;
    if (tm == false && frameCount % 10 == 0 && done == false) {
      mark[frame].resize(32, 32);
      attachImage(mark[frame]);
      frame ++;
    }
    if(tm == false && done == true) {
      flower.setSensor(true);
      flower.attachImage(ocean);
      attachImage(newmark);
    }
  }

  void move() {
    if (isTouching("player") && player.getY() > getY() + gridSize/2) {
      attachImage(newmark);
      tm = true;
      done = true;
    }

    if (tm == true && done == true) {
      flower.setSensor(false);
      flower.attachImage(fireflwr);
      //} else if(tm == false) {
      //  flower.attachImage(ocean);
      //}
    }
  }
}
